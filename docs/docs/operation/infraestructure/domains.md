# Domains

## DEV

- `login-dev.cenabast.gob.cl`
- `tienda-dev.cenabast.gob.cl`

## Letsencrypt

:::tip
As we are using port `443` we need to implement an SSL certificate for each domain. 
:::

## Redirection

:::info
Traffic to domain `login-dev.cenabast.gob.cl` must be forwarded to the Keycloak docker application.
Traffic to domain `tienda-dev.cenabast.gob.cl` must be forwarded to the Spree Commerce docker application.
:::