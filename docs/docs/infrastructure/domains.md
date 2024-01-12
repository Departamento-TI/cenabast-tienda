# Domains

## Development

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
Traffic to domain `login-dev.cenabast.gob.cl` must be forwarded to the [Keycloak docker](./applications/keycloak) application.\
Traffic to domain `tienda-dev.cenabast.gob.cl` must be forwarded to the [Spree Commerce](./applications/spree) docker application.
:::