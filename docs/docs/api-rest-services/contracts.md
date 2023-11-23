---
title: Contrats
published: true
date: 2023-11-06T21:29:25.260Z
editor: markdown
dateCreated: 2023-11-06T15:10:54.660Z
---

# Resume

After an auction, the winner bidder signs a contract with Cenabast.

# API Service

# API example

**Request API for producto ZGEN: 100003753**

```ruby
curl --request POST \
  --url https://testaplicacionesweb.cenabast.cl:7001/WebApi2/api/v2/Public/contrato \
  --header 'Authorization: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjEiLCJyb2xlIjoiUHJvdmVlZG9yIiwibmJmIjoxNjk5MjgzMDEzLCJleHAiOjE2OTkyODQ4MTMsImlhdCI6MTY5OTI4MzAxMywiaXNzIjoiaHR0cDovL2xvY2FsaG9zdC8iLCJhdWQiOiJodHRwOi8vbG9jYWxob3N0LyJ9.rFaQ4Ge_InmlxEEpdZ7JaVXMzpWCe48jc-Jdeg9Pf9s' \
  --header 'content-type: application/json' \
  --data '{
"ZGEN": "100003753"
}'
```

**Response:**

```json
[
  {
    "PedidoCompra": "4500026400",
    "IdMercadoPublico": "621-1224-SE21     ",
    "ordenDeCompra": "621-460-LR21      ",
    "Posicion": "120",
    "fechaEntrega": "01-12-2022 0:00:00",
    "ZGEN": "100003753",
    "NombreZgen": "FINGOLIMOD 0,5 MG CP                    ",
    "GrupoArticulo": "3RI      ",
    "ZCEN": "500007740",
    "NombreZCEN": "EMINOD (FINGOLIMOD) 0,5 MG CAJ 30 CP    ",
    "Cantidad": 30,
    "UnidadVenta": "CAJ",
    "NombreProveedor": "ASCEND LABORATORIES SPA",
    "RutProveedorSinDv": 76175092,
    "RutProveedorConDv": "76175092-5",
    "ValorNeto": 21000.0,
    "Valoriva": 3990.0,
    "ValorTotal": 24990.0,
    "FInicialContrato": "202201",
    "FFinalContrato": "202306"
  },
  {

  }
 ]
```

:::tip
When listing all available contracts, the information given is related to the programmed purchase, which shows the QTY per month:
:::

![2023-11-06_18-25_1.png](/images/2023-11-06_18-25_1.png)