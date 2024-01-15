---
title: User API Service
published: true
date: 2023-11-08T13:36:05.941Z
editor: markdown
dateCreated: 2023-11-06T15:43:14.854Z
---

## Resume

:::tip
This API returns all related organizations to a particular user using the <kbd>RUT</kbd> value.
:::

:::note
User will login using <kbd>Clave Unica</kbd> IdP.\
[Login](login.md) will be implemented using a Single Sign On (SSO) solution, like keycloak.\
:::

:::note
User will need to complete the following information:
:::


![2023-11-06_17-49.png](/images/2023-11-06_17-49.png)


## RUT user Request

:::warning
After user is authenticated, using the user RUT we should request organizations related to the user.\
Request: **RUT usuario**\. The [token](user-api-authentication) value must be requested with the authentication API.
:::

```jsx
GET https://<<HOST>>/proyectosti/apiusuarios/v1/recurso/tienda/destinatarios/{{RUT}} \
--header 'Authorization: Bearer {{token}}'
```
  	


## Response (Respuesta deseable)

:::tip
> **Basicamente se requiere**:\
\
👉 Organismos **solicitantes** asociados al RUT\
👉 Organismos **destinatarios** por cada Organismo Solicitante\
👉 **Puerto de descarga** por cada organismo destinatario.\
👉 **Líneas autorizadas** de Compra asociadas al RUT\
:::

:::warning
El siguiente servicio **sólo responde con los organismos solicitantes asociados al RUT del usuario**.
:::

### Response table view

![2023-11-08_10-34.png](/images/2023-11-08_10-34.png)

### Full JSON response

```jsx
GET https://{{HOST}}/proyectosti/apiusuarios/v1/recurso/tienda/destinatarios/16338556 \
  --header 'Authorization: Bearer {{token}}'
```

<details>
  <summary>Full JSON response for a particular <kbd>RUT</kbd> value 👇</summary>
  <div>
```jsx
[
  {
    "rut_usuario": 16338556,
    "idRelacion": 221,
    "rutSolicitante": 61607600,
    "solicitante": "S.S. OSORNO",
    "rutDestinatario": 201707,
    "destinatario": "CESFAM RAHUE",
    "canal": 1,
    "nombreCanal": "INTERMEDIACION",
    "direccionDespacho": ""
  },
  {
    "rut_usuario": 16338556,
    "idRelacion": 4451,
    "rutSolicitante": 61607600,
    "solicitante": "S.S. OSORNO",
    "rutDestinatario": 201708,
    "destinatario": "SS Osorno Bodega",
    "canal": 3,
    "nombreCanal": "ARTROSIS",
    "direccionDespacho": ""
  },
  {
    "rut_usuario": 16338556,
    "idRelacion": 4452,
    "rutSolicitante": 61607600,
    "solicitante": "S.S. OSORNO",
    "rutDestinatario": 201708,
    "destinatario": "SS Osorno Bodega",
    "canal": 6,
    "nombreCanal": "CARDIOVASCULAR",
    "direccionDespacho": ""
  },
  {
    "rut_usuario": 16338556,
    "idRelacion": 4453,
    "rutSolicitante": 61607600,
    "solicitante": "S.S. OSORNO",
    "rutDestinatario": 201708,
    "destinatario": "SS Osorno Bodega",
    "canal": 14,
    "nombreCanal": "IRA ERA",
    "direccionDespacho": ""
  },
  {
    "rut_usuario": 16338556,
    "idRelacion": 4454,
    "rutSolicitante": 61607600,
    "solicitante": "S.S. OSORNO",
    "rutDestinatario": 201708,
    "destinatario": "SS Osorno Bodega",
    "canal": 16,
    "nombreCanal": "PARKINSON",
    "direccionDespacho": ""
  },
  {
    "rut_usuario": 16338556,
    "idRelacion": 7341,
    "rutSolicitante": 61607600,
    "solicitante": "S.S. OSORNO",
    "rutDestinatario": 201708,
    "destinatario": "SS Osorno Bodega",
    "canal": 58,
    "nombreCanal": "GES DE 6 AÑOS",
    "direccionDespacho": ""
  },
  {
    "rut_usuario": 16338556,
    "idRelacion": 7370,
    "rutSolicitante": 61607600,
    "solicitante": "S.S. OSORNO",
    "rutDestinatario": 201708,
    "destinatario": "SS Osorno Bodega",
    "canal": 59,
    "nombreCanal": "GES DE EMBARAZADAS",
    "direccionDespacho": ""
  },
  {
    "rut_usuario": 16338556,
    "idRelacion": 5316,
    "rutSolicitante": 61607600,
    "solicitante": "S.S. OSORNO",
    "rutDestinatario": 201708,
    "destinatario": "SS Osorno Bodega",
    "canal": 27,
    "nombreCanal": "TBC",
    "direccionDespacho": ""
  },
  {
    "rut_usuario": 16338556,
    "idRelacion": 7312,
    "rutSolicitante": 61607600,
    "solicitante": "S.S. OSORNO",
    "rutDestinatario": 201708,
    "destinatario": "SS Osorno Bodega",
    "canal": 57,
    "nombreCanal": "SEMBRANDO SONRISAS",
    "direccionDespacho": ""
  },
  {
    "rut_usuario": 16338556,
    "idRelacion": 8342,
    "rutSolicitante": 61607600,
    "solicitante": "S.S. OSORNO",
    "rutDestinatario": 201708,
    "destinatario": "SS Osorno Bodega",
    "canal": 50,
    "nombreCanal": "PROGRAMACIÓN GES 60 AÑOS",
    "direccionDespacho": ""
  },
  {
    "rut_usuario": 16338556,
    "idRelacion": 10741,
    "rutSolicitante": 61607600,
    "solicitante": "S.S. OSORNO",
    "rutDestinatario": 201708,
    "destinatario": "SS Osorno Bodega",
    "canal": 68,
    "nombreCanal": "ADULTO 60 AÑOS",
    "direccionDespacho": ""
  },
  {
    "rut_usuario": 16338556,
    "idRelacion": 4455,
    "rutSolicitante": 61607600,
    "solicitante": "S.S. OSORNO",
    "rutDestinatario": 201708,
    "destinatario": "SS Osorno Bodega",
    "canal": 18,
    "nombreCanal": "PRESBICIA",
    "direccionDespacho": ""
  },
  {
    "rut_usuario": 16338556,
    "idRelacion": 4456,
    "rutSolicitante": 61607600,
    "solicitante": "S.S. OSORNO",
    "rutDestinatario": 201708,
    "destinatario": "SS Osorno Bodega",
    "canal": 20,
    "nombreCanal": "PROG. MUJER",
    "direccionDespacho": ""
  },
  {
    "rut_usuario": 16338556,
    "idRelacion": 4457,
    "rutSolicitante": 61607600,
    "solicitante": "S.S. OSORNO",
    "rutDestinatario": 201708,
    "destinatario": "SS Osorno Bodega",
    "canal": 26,
    "nombreCanal": "EPILEPSIA",
    "direccionDespacho": ""
  },
  {
    "rut_usuario": 16338556,
    "idRelacion": 4458,
    "rutSolicitante": 61607600,
    "solicitante": "S.S. OSORNO",
    "rutDestinatario": 201708,
    "destinatario": "SS Osorno Bodega",
    "canal": 49,
    "nombreCanal": "HIPOTIROIDISMO",
    "direccionDespacho": ""
  },
  {
    "rut_usuario": 16338556,
    "idRelacion": 2666,
    "rutSolicitante": 61607600,
    "solicitante": "S.S. OSORNO",
    "rutDestinatario": 201992,
    "destinatario": "COSAM ORIENTE",
    "canal": 1,
    "nombreCanal": "INTERMEDIACION",
    "direccionDespacho": ""
  },
  {
    "rut_usuario": 16338556,
    "idRelacion": 9200,
    "rutSolicitante": 61607600,
    "solicitante": "S.S. OSORNO",
    "rutDestinatario": 201992,
    "destinatario": "COSAM ORIENTE",
    "canal": 64,
    "nombreCanal": "IVE",
    "direccionDespacho": ""
  },
  {
    "rut_usuario": 16338556,
    "idRelacion": 15611,
    "rutSolicitante": 61607600,
    "solicitante": "S.S. OSORNO",
    "rutDestinatario": 205226,
    "destinatario": "DROGUERIA SS OSORNO",
    "canal": 74,
    "nombreCanal": "",
    "direccionDespacho": ""
  },
  {
    "rut_usuario": 16338556,
    "idRelacion": 14041,
    "rutSolicitante": 61607600,
    "solicitante": "S.S. OSORNO",
    "rutDestinatario": 205226,
    "destinatario": "DROGUERIA SS OSORNO",
    "canal": 62,
    "nombreCanal": "DISRAFIAS",
    "direccionDespacho": ""
  },
  {
    "rut_usuario": 16338556,
    "idRelacion": 14042,
    "rutSolicitante": 61607600,
    "solicitante": "S.S. OSORNO",
    "rutDestinatario": 205226,
    "destinatario": "DROGUERIA SS OSORNO",
    "canal": 69,
    "nombreCanal": "GES MAYORES 65 AÑOS",
    "direccionDespacho": ""
  },
  {
    "rut_usuario": 16338556,
    "idRelacion": 14043,
    "rutSolicitante": 61607600,
    "solicitante": "S.S. OSORNO",
    "rutDestinatario": 205226,
    "destinatario": "DROGUERIA SS OSORNO",
    "canal": 61,
    "nombreCanal": "HERMORRAGIA SUBARACNOIDEA",
    "direccionDespacho": ""
  },
  {
    "rut_usuario": 16338556,
    "idRelacion": 14044,
    "rutSolicitante": 61607600,
    "solicitante": "S.S. OSORNO",
    "rutDestinatario": 205226,
    "destinatario": "DROGUERIA SS OSORNO",
    "canal": 63,
    "nombreCanal": "PARKINSON",
    "direccionDespacho": ""
  },
  {
    "rut_usuario": 16338556,
    "idRelacion": 14887,
    "rutSolicitante": 61607600,
    "solicitante": "S.S. OSORNO",
    "rutDestinatario": 205226,
    "destinatario": "DROGUERIA SS OSORNO",
    "canal": 72,
    "nombreCanal": "",
    "direccionDespacho": ""
  },
  {
    "rut_usuario": 16338556,
    "idRelacion": 15249,
    "rutSolicitante": 61607600,
    "solicitante": "S.S. OSORNO",
    "rutDestinatario": 205226,
    "destinatario": "DROGUERIA SS OSORNO",
    "canal": 73,
    "nombreCanal": "",
    "direccionDespacho": ""
  },
  {
    "rut_usuario": 16338556,
    "idRelacion": 14040,
    "rutSolicitante": 61607600,
    "solicitante": "S.S. OSORNO",
    "rutDestinatario": 205226,
    "destinatario": "DROGUERIA SS OSORNO",
    "canal": 60,
    "nombreCanal": "ACCIDENTE CEREBRO VASCULAR",
    "direccionDespacho": ""
  }
]
```
</div>
</details>


