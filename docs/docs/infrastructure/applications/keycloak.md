# Keycloak

### Resume

:::tip[Admin Access]
Single Sign On

URL: https://login-dev.cenabast.gob.cl/admin/ \
KEYCLOAK_USER: `admin`\
KEYCLOAK_PASSWORD: `owwIZLI#6m65`
:::

:::info[Docker image]
👉 Check Keycloak [docker-compose.yml](https://github.com/Departamento-TI/cenabast-tienda/blob/main/docker-compose.yml).\
👉 Keycloak image is build from file [Dockerfile.keycloak](https://github.com/Departamento-TI/cenabast-tienda/blob/main/Dockerfile.keycloak)    
:::

### Keycloak user & database

The first time Keycloak is deploy, a `keycloak` user and role must be created in the postgres database.
The password must match the password of `KC_DB_PASSWORD` at the [Dockerfile.keycloak](https://github.com/Departamento-TI/cenabast-tienda/blob/main/Dockerfile.keycloak).

```jsx
CREATE ROLE keycloak;
CREATE USER keycloak WITH PASSWORD 'password';
GRANT ALL PRIVILEGES ON DATABASE keycloak to keycloak;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO keycloak;
GRANT ALL ON SCHEMA public TO keycloak;
```


### Keycloak Setup

:::info[Setup]
After Keycloak docker is deployed, the following configurations needs to be done in order to integrate with [Clave Unica](../clave_unica.md).\
:::


### Create Cenabast Realm

Create a new realm:

![createrealm](/img/Peek2023-12-19-17-10.gif)


### Create "cenabast-ecommerce" client

:::danger[Import Client Config]
The initial OIDC client configuration can be imported using the following file [cenabast-ecommerce.json](/img/cenabast-ecommerce.json).\
The client value must match the `KEYCLOAK_CLIENT_ID` in the .ENV file.
:::

![import-config](/img/2024-03-11_13-38.png)

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
