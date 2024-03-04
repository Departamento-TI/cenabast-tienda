---
title: Login Process
published: true
date: 2024-02-15T14:02:49.917Z
editor: markdown
dateCreated: 2024-02-15T21:45:58.170Z
---

# Overview

:::info
This doc explains how the implementation the login process flow and authorization onto the site
:::

See also:
* [Clave Unica](clave-unica.md)
* [Clave Unica IdP](/cenabast-tienda/docs/infrastructure/clave_unica)
* [Keycloak](/cenabast-tienda/docs/infrastructure/applications/keycloak)

The Cenabast site only should be accessed for authorized users.

Here it is detailed how the login flow works and how the authorization check is done.

## Implementation

The access to the commerce site is restricted to only be accessed for authorized users.

If the user is not authenticated, it will be redirected to the login page.

When the user tries to log-in, it will be prompted with a login via ClaveUnica. We use Keycloak to manage an OpenID flow and obtain authentication from the ClaveUnica IdP site.

Upon a successful autentication from Keycloak/ClaveUnica, the user infromation will be redirected back to our site, onto the `OmniauthCallbacksController#clave_unica` endpoint/action.

Then, the requested RUN (RUT of user that is about to log in) is queried against the Cenabast APIs, using the `Cenabast::Spree::User::InformationUpdater` class. This class is in charge of querying and updating information from:

* Buyer user attributes
* Provider user attributes
* List of Requesters and Receivers for user (Solicitantes/Destinatarios)
* List of Businesses for user (Empresas)

Information is queried from Cenabast APIs using an API Client from Ruby, and then dumped into Spree related models.

If models didnt exist before, they will be created. Existing models will be updated to reflect the newest information.

If a Receiver o Business that belonged to a user is not currently returned in the new response, the association between the user and the receiver/business will be removed. The Receiver/Business will continue to exist by itself.

Then, the requested user RUN is validated if it has meets the criteria to access the site.
The service in charge of doing this verification is the `Cenabast::Spree::User::LoginValidator`.

The flow works as following (2024/02/27):

* The RUN is searched into the user records
* Validations are evaluated
    * User must exist
    * User must have valid roles (user must have role buyer)
    * Being a buyer user (having a buyer role), the user must have at least one Receiver linked to operate

:white_check_mark: If the validations are met, the LoginValidator will return a success state, and the user will be logged onto the site.

:x: If the validations are not met, the LoginValidator returns a false value, an error notification message is set and the user is redirected back to the login page.

### Important environment variables

* CENABAST_API_BASE_URL
    * Root URL to use

* CENABAST_API_BASE_PATH
    * Base path that points to the root of the API to use

* CENABAST_API_USER
    * API User to obtain a token from

* CENABAST_API_PASSWORD
    * Password of the API user

* CENABAST_API_TOKEN_EXPIRE_TIME
    * How long the token will be cached onto cache store. Value in minutes, defaults to 30.