# Keycloak

### Resume

:::tip
Single Sign On

URL: https://login-dev.cenabast.gob.cl/admin/ \
KEYCLOAK_USER: `admin`\
KEYCLOAK_PASSWORD: `owwIZLI#6m65`
:::

:::info
Check Keycloak `docker-compose.yml` deployment [here](../dev-server#docker-compose).
:::

# Keycloak Setup

:::info[Setup]
After Keycloak docker is deployed, the following configurations needs to be done in order to integrate with [Clave Unica](../clave_unica.md).
:::

### Create Cenabast Realm

![createrealm](/img/Peek2023-12-19-17-10.gif)

### Create Clave Unica IdP

:::tip
**Clave Unica Discovery Endpoint**:\
https://accounts.claveunica.gob.cl/openid/.well-known/openid-configuration
:::

![Add-ClaveUnica_idp](/img/Peek2023-12-19-17-16.gif)

### Redirect directly to IdP

:::warning
In order to skip Keycloak Login form, we can **redirect** inmediatly to the ClaveUnica Identity Provider.\
In the browser authentication flow, just configure the alias of your idp (in this case, "**oidc**" is the alias)
:::

![Redirect-to-idp](/img/Peek2023-12-19-17-18.gif)

### Disable Review Profile

:::info
Disable the "Review Profile" action from the "first broker login" flow.
:::

![DisableReviewProfile](/img/Peek2023-12-19-18-01.gif)

### Disable Profile form

:::warning
In order to prevent Keycloak from requesting filling the profile form, we need to disable the "**Update Profile**" required action.
:::

![Disable-profile-form](/img/Peek2023-12-19-17-19.gif)

### Test Login

:::tip[Testing RUT values]
Clave Unica test users:

RUN: 44.444.444-4 	contraseña: **testing**\
RUN: 55.555.555-5	contraseña: **testing**\
RUN: 88.888.888-8 	contraseña: **testing**\
RUN: 99.999.999-9 	contraseña: **testing**

::::info[Login URL test]
https://login-dev.cenabast.gob.cl/realms/cenabast/account/#/
:::

![testing](/img/Peek2023-12-19-18-00.gif)
