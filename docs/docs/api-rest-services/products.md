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

```ruby
curl --request GET \
  --url https://testaplicacionesweb.cenabast.cl:7001/WebApi2/api/v2/material/listacatalogo \
  --header 'Authorization: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjEiLCJyb2xlIjoiUHJvdmVlZG9yIiwibmJmIjoxNjk5MjgzMDEzLCJleHAiOjE2OTkyODQ4MTMsImlhdCI6MTY5OTI4MzAxMywiaXNzIjoiaHR0cDovL2xvY2FsaG9zdC8iLCJhdWQiOiJodHRwOi8vbG9jYWxob3N0LyJ9.rFaQ4Ge_InmlxEEpdZ7JaVXMzpWCe48jc-Jdeg9Pf9s'
```

**Response**:

```json
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
