---
title: API REST Services
published: true
date: 2023-11-08T14:53:34.284Z
editor: markdown
dateCreated: 2023-10-25T14:36:36.278Z
---

# Resume

The Store will need to handle multiple connections or integrations with third party services:\
👉 GET ERP (SAP) for fetching product data.\
👉 POST to ERP (SAP) new Sales Orders.\
👉 POST to Mercado Publico Purchase Order.\
👉 POST to SIGFE Purchase Order **budget validation**.\
👉 GET Invoice.\



Each service has its own Authentication, Cache policies, etc. Which is why it make sense to <mark>**implement an API gateway**</mark> for proper management. 


[!NOTE]
All API endpoints will be available for testing [here](https://postman.patagon.dev/).\
Authentication is required. 


# API Services

- [User Authentication *Clave Unica*](login.md)


# API User Service

- [API authentication](user-api-authentication.md)
- [Get User Company Relations](api-rest-services/users.md)


# API Products 
- [API authentication](api-authentication.md)
- [Organismos](organismos.md)
- [Products](products.md)
- [Contracts](contracts.md)

# API Forecast
- [Forecast *<mark>pending</mark>*](forecast.md)

# API Checkout & Push Orders
- [Checkout *<mark>pending</mark>*](checkout.md)
- [Purchase Order *Mercado Publico <mark>pending</mark>*](purchase-order.md)
- [Validate Stock from SAP *<mark>pending</mark>*](validate-order-from-sap.md)
- [PUSH Order to SAP *<mark>pending</mark>*](push-order-to-sap.md)
- [SIGFE *<mark>pending</mark>*](sigfe.md)


# API list

- [API Cenabast Directory WebAPI2 *external link*](https://testaplicacionesweb.cenabast.cl:7001/WebApi2/documentacion/index.html#/)
- [API Cenabast Sellers *API por Sellers for managing orders*](https://aplicacionesweb.cenabast.cl/webapi/swagger/ui/index#)


# API for Vendors

[!WARNING]
⚠️ Pending. This API services are mainly for Vendors that needs to manage orders.

- [API Public Distribution](seller-public-distribution.md)
