# Domains

## DEV

- `login-dev.cenabast.gob.cl`
- `tienda-dev.cenabast.gob.cl`

## Production

:::warning[Pending]
Production website is not currently active. 
:::

- `login.cenabast.gob.cl`
- `tienda.cenabast.gob.cl`

## Letsencrypt

:::tip
As we are using port `443` we need to implement an SSL certificate for each domain. 
:::

## Redirection

:::info
Traffic to domain `login-dev.cenabast.gob.cl` must be forwarded to the [Keycloak docker](https://departamento-ti.github.io/cenabast-tienda/docs/business/infrastructure/applications#docker-keycloak) application.\
Traffic to domain `tienda-dev.cenabast.gob.cl` must be forwarded to the [Spree Commerce](https://departamento-ti.github.io/cenabast-tienda/docs/business/infrastructure/applications#docker-spree-commerce) docker application.
:::