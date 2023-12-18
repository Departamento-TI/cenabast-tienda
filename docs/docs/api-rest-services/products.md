---
title: Products
published: true
date: 2023-11-06T15:06:42.135Z
editor: markdown
dateCreated: 2023-10-26T16:27:49.356Z
---

# Resume
Your content here

# Product APIs

- [Product API List](https://testaplicacionesweb.cenabast.cl:7001/WebApi2/documentacion/index.html#/Material)


![2023-10-26_13-27.png](/2023-10-26_13-27.png)

# API example

**Request**:

```jsx
GET /WebApi2/api/v2/material/listacatalogo\
  --header 'Authorization: token'
```

**Response**:

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
    ...
  }
]
```
