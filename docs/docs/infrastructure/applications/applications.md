# Applications

We need to deploy the following applications in the DEV server:

- PostgreSQL
- Keycloak
- Spree Commerce

:::info
All applications must be deployed using Docker container.
Ideally, we need to build the image locally.
:::



# Docker

:::tip
Al applications must be deploy as docker images using the followng [Docker-Compose file](https://github.com/Departamento-TI/cenabast-tienda/blob/spree-4-7-development-with-frontend/docker-compose.yml)
:::

## Docker PostgreSQL

:::tip[Database]
Both Keycloak and Spree Commerce should use the same postgres service.
:::

Docker Repo:

https://github.com/docker-library/postgres

## Docker Keycloak

Docker info:

https://www.keycloak.org/server/containers


## Docker Spree Commerce

:::info
This is our custom Spree Project. \
Please deploy branch `spree-4-7-development-with-frontend`
:::


https://github.com/Departamento-TI/cenabast-tienda/

