# Clave Única IdP

### Resume

:::info
All Government institutions, are required to use a unique password for all Chilean citizen. This service is provided by [Clave Unica](https://claveunica.cl/).
:::

:::tip[💡]
Clave Unica is integrated as an Identity Provider (idP) within [Keycloak](applications/keycloak.md)
:::

## Domain

:::info[Domain]
The domain `login-dev.cenabast.gob.cl` will be used for authentication with Clave Unica. (**Development**)\
The domain `login.cenabast.gob.cl` will be used for authentication with Clave Unica. (**production**)
:::

## Clave Unica Developement Credentials

<details>
  <summary>Clave Unica IDs</summary>
  <div>
    <div>
    Client ID SANDBOX: 9c52faccf4324a52808f7e4739b58b41\
    Client Secret SANDBOX: ed711883169b4b82beaf9b7925697529\
\
    Client ID QA: 9e0ad6ebedb342c08640ddd94ee4a80c\
    Client Secret QA: c587e1dce57a4c209bed73d776ea9990\
 \
    Client ID Producción: 191686e57a3e4b8994f63b7b4e90014c\
    Client Secret Producción: 1e8c36c5dc22450bbf999fce62a22a72
    </div>
    
  </div>
</details>



### Technical Documentation

:::tip[Document]
[Here](https://digital.gob.cl/transformacion-digital/estandares-y-guias/guia-tecnica-para-integracion-de-claveunica/) you can find the latest technical document regarding Clave Unica.
:::
