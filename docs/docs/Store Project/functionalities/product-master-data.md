---
title: Product Master Data
published: true
date: 2023-10-26T21:31:46.730Z
editor: markdown
dateCreated: 2023-10-26T16:22:01.572Z
---

# Resume
:::note
Product data resides on SAP ERP system.
:::


# Get Product Catalog

Request:



```jsx
GET https://<<aplicacionweb>>/WebApi2/api/v2/material/listacatalogo
```

Response:



```jsx
[
  {
    "CODIGO_PRODUCTO": "100000000",
    "TIPO_PRODUCTO": "ZGEN",
    "GRUPO_ARTICULO": "3TB",
    "CODIGO_SECTOR": "S1",
    "DESCRIPCION_SECTOR": "Fármacos",
    "DENOMINACION": "RIFAMPICINA/ISONIAZIDA 150/150 MG CM/CP",
    "CODIGO_ATC": "IQVIATECH--K",
    "DENOMINACION_ESTANDAR": "2-CDF-RH",
    "CODIGO_ONU": "51102002",
    "TABLA_BASE": "2.2",
    "JERARQUIA": "0010000200007",
    "UMP": "",
    "FABRICANTE": "",
    "CODIGO_EAN": "",
    "DESCRIPCIONGRUPOARTICULO": "TBC"
  },
  {
    "CODIGO_PRODUCTO": "100000003",
    "TIPO_PRODUCTO": "ZGEN",
    "GRUPO_ARTICULO": "1IN",
    "CODIGO_SECTOR": "S1",
    "DESCRIPCION_SECTOR": "Fármacos",
    "DENOMINACION": "A.A SALICILIC 100MG CM/CM REC/CP",
    "CODIGO_ATC": "01AC06",
    "DENOMINACION_ESTANDAR": "ACIDO ACETIL SALI.",
    "CODIGO_ONU": "51142002",
    "TABLA_BASE": "2.1",
    "JERARQUIA": "0010000500006",
    "UMP": "",
    "FABRICANTE": "",
    "CODIGO_EAN": "",
    "DESCRIPCIONGRUPOARTICULO": "INTERMEDIACION"
  }
]
```