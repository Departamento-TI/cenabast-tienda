# Buyer User relations

## Resume

:::info
The following API returns all the related institutions for a particular **buyer** user.
:::

## Request

```jsx
GET '{{host}}/interoperabilidad/tienda/api/v1/destinatarios/16338556' \
--header 'Authorization: Bearer {{token}}'

```

## Response

<details>
  <summary>**JSON** reponse for RUT value 16338556 👇</summary>
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
        "nombreCanal": "PARKINSON.",
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
        "nombreCanal": "OSTEOSARCOMA",
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
        "nombreCanal": "(AATT)DISRAFIAS",
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
        "nombreCanal": "(AATT)GES MAYORES 65 AÑOS",
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
        "nombreCanal": "(AATT)HERMORRAGIA SUBARACNOIDEA",
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
        "nombreCanal": "(AATT)PARKINSON",
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
        "nombreCanal": "AYUDAS TECNICAS NO GES",
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
        "nombreCanal": "ESCLEROSIS MULTIPLE AATT",
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
        "nombreCanal": "(AATT)ACCIDENTE CEREBRO VASCULAR",
        "direccionDespacho": ""
    }
]
```
</div>
</details>

<details>
  <summary>**Table** view of JSON resepone</summary>
  <div>
![2023-11-08_10-34.png](/images/2023-11-08_10-34.png)
</div>
</details>