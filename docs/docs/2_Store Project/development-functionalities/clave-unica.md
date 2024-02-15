---
title: Clave Unica
published: true
date: 2024-02-15T14:02:49.917Z
editor: markdown
dateCreated: 2024-02-15T21:45:58.170Z
---

# Overview

:::info
This doc explains how the implementation of login with Clave Unica was done in the Spree Cenabast project.
:::

See also:
* [Clave Unica IdP](/cenabast-tienda/docs/infrastructure/clave_unica)
* [Keycloak](/cenabast-tienda/docs/infrastructure/applications/keycloak)

Keycloak is used for managing single sign-on from the Cenabast e-commerce application. A Keycloak realm is configured setting ClaveUnica as its identity provider

## Implementation

The default Spree authentication system (user/password) has been changed to use instead OmniAuth.
We created a custom strategy for OmniAuth, to use the Keycloak realm as the autentication provider.

When the users click the login button, they get redirected to Keycloak and follow a OpenID flow. Using ClaveUnica as the identity provider.

The redirect lands on `spree_user_clave_unica_omniauth_callback_path`. The application obtains the access_token based on the one-time code provided by Keyclock. With this, it can obtain user info.

At the moment (2024/02/15), we only obtain the `preferred_username` as significative information as part of the response. This field will contain the user RUN.

For protecting unrestricted access. A before_action logic was configured in order to redirect every (non-devise) action from guest users to the login page.

### Keycloak requirements

* A Keycloak distribution must be available.
* The IdP provider must be set as Clave unica
* A Client must be created for its use in the Spree application (Client ID and Secret must be provided).
* The Client must be able to pull the needed scopes (openid profile email)
* The access setting URLs must match the URls that the application uses (Root URL, Home URL, Redirect URIs, Post logout redirect URIs, Web Origins)

### Important environment variables

* KEYCLOAK_CLIENT_ID
    * Client ID

* KEYCLOAK_CLIENT_SECRET
    * Client Secret to use (left blank to not use secret)

* KEYCLOAK_SITE_URL 
    * URL where Keycloak is hosted

* KEYCLOAK_REALM
    * Realm to use
