
# ============================================================
# Immich storage
#
# PostgreSQL, Valkey and ML cache use the SSD pool.
# The media library uses the mirrored HDD pool.
# ============================================================

resource "truenas_dataset" "immich_postgres" {
  name          = "apps/immich-postgres"
  share_type    = "APPS"
  compression   = "LZ4"
  force_destroy = false

  lifecycle {
    prevent_destroy = true
  }
}

resource "truenas_dataset" "immich_redis" {
  name          = "apps/immich-redis"
  share_type    = "APPS"
  compression   = "LZ4"
  force_destroy = false

  lifecycle {
    prevent_destroy = true
  }
}

resource "truenas_dataset" "immich_machine_learning" {
  name          = "apps/immich-machine-learning"
  share_type    = "APPS"
  compression   = "LZ4"
  force_destroy = false

  lifecycle {
    prevent_destroy = true
  }
}

resource "truenas_dataset" "immich_library" {
  name          = "bulk/immich-library"
  share_type    = "APPS"
  compression   = "LZ4"
  force_destroy = false

  lifecycle {
    prevent_destroy = true
  }
}

# ============================================================
# Immich application
# ============================================================

resource "truenas_app" "immich" {
  name       = "immich"
  custom_app = true
  running    = true

  depends_on = [
    truenas_dataset.immich_postgres,
    truenas_dataset.immich_redis,
    truenas_dataset.immich_machine_learning,
    truenas_dataset.immich_library
  ]

  custom_compose_config_string = <<-YAML
    name: immich

    services:
      immich-server:
        container_name: immich_server
        image: ghcr.io/immich-app/immich-server:v3@sha256:7c489add298fc2f92cda4c777de6462aa206877e04087b815f62c7664af0b53b

        volumes:
          - /mnt/bulk/immich-library:/data
          - /etc/localtime:/etc/localtime:ro

        ports:
          - "2283:2283"

        environment:
          TZ: Europe/Bucharest
          DB_HOSTNAME: database
          DB_PORT: "5432"
          DB_USERNAME: immich
          DB_DATABASE_NAME: immich
          REDIS_HOSTNAME: redis

        depends_on:
          redis:
            condition: service_healthy
          database:
            condition: service_healthy

        restart: always

      immich-machine-learning:
        container_name: immich_machine_learning
        image: ghcr.io/immich-app/immich-machine-learning:v3@sha256:8adebf414256f6e4f837bfbb66fa94f14f4da7260e3a1d65cbba49e4e35d8764

        volumes:
          - /mnt/apps/immich-machine-learning:/cache

        environment:
          TZ: Europe/Bucharest

        restart: always

      redis:
        container_name: immich_redis
        image: valkey/valkey:9@sha256:3add1a336a920ea54770a001ab6feb3da5fceea96a40373a3a2cd469b815f0b7

        volumes:
          - /mnt/apps/immich-redis:/data

        healthcheck:
          test: ["CMD", "valkey-cli", "ping"]
          interval: 10s
          timeout: 5s
          retries: 5
          start_period: 10s

        restart: always

      database:
        container_name: immich_postgres
        image: ghcr.io/immich-app/postgres:14-vectorchord0.4.3-pgvectors0.2.0@sha256:bcf63357191b76a916ae5eb93464d65c07511da41e3bf7a8416db519b40b1c23

        environment:
          POSTGRES_USER: immich
          POSTGRES_DB: immich
          POSTGRES_INITDB_ARGS: "--data-checksums"

        volumes:
          - /mnt/apps/immich-postgres:/var/lib/postgresql/data

        shm_size: 128mb

        restart: always

  YAML

  # Passwords are supplied separately through the write-only
  # Compose configuration field. They are not embedded in the
  # regular Compose configuration string.

  custom_compose_config_string_wo = yamlencode({
    services = {
      immich-server = {
        environment = {
          DB_PASSWORD = var.immich_db_password
        }
      }

      database = {
        environment = {
          POSTGRES_PASSWORD = var.immich_db_password
        }
      }
    }
  })

  custom_compose_config_string_wo_version = 1
}
