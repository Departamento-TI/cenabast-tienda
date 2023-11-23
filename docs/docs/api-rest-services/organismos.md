---
title: API - Organismos
published: true
date: 2023-11-06T21:16:40.409Z
editor: markdown
dateCreated: 2023-11-06T20:56:48.193Z
---

# Resume

:::info
API for returning all data related to the company.
:::

# API Organismos

## Request

:::note
Request should only include the required RUT value (eg. RUT: `60808700-1`)
:::


## Response

:::note
Response should include all data related to the organization.

```json
{
  "RUT": "60808700-1",
  "sazon_social": "Servicio de Salud Metropolitana SUR ORIENTE",
  "calle": "Alameda",
  "calle_numero": "1234",
  "comuna": "Providencia",
  "ciudad": "Santiago",
  "Usuarios_roles": [
    {"rut": "10268889-9", "roles": "admin"},
    {"rut":"9976913-0", "roles": "comprador"},
    {"rut":"22274688-4", "roles": "farmaceutico, comprador"}
  ],
  "Destinatarios": [
    "70000000-1",
    "72300400-8",
    "71090000-4"
  ],
  "Puertos_descarga": [
    {"calle": "Alameda", "calle_numero": "1234", "comuna": "Santiago Centro", "ciudad": "Santiago"},
    {"calle": "Irarrazabal", "calle_numero": "10890", "comuna": "Nuñoa", "ciudad": "Santiago"},
    {"calle": "Manuel Montt", "calle_numero": "788", "comuna": "Antofagasta", "ciudad": "Antofagasta"}
  ],
}
```
