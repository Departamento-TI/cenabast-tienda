---
title: Vendors
published: true
date: 2023-11-08T14:59:12.977Z
editor: markdown
dateCreated: 2023-11-08T14:59:12.977Z
---

# Header
Your content here

## Request

GET  `https://{{HOST}}/WebApi2/api/v2/Public/distribucion`


## Response

```ruby
| IdDistribucion | Rut_Proveedor | Doc_Cenabast | Factura | Fecha_Fac          | Guia  | Fecha_Gui         | O_Trans | Detalles__Doc_Cenabast | Detalles__Articulo | Detalles__Lote | Detalles__Cantidad | Detalles__FechaCreacion | Detalles__FechaActualizacion | Movimientos__Doc_Cenabast | Movimientos__Fecha | Movimientos__Hora | Movimientos__DescMovimiento | Movimientos__RecibidoPor |
|----------------|---------------|--------------|---------|--------------------|-------|-------------------|---------|------------------------|--------------------|----------------|--------------------|-------------------------|------------------------------|---------------------------|--------------------|-------------------|-----------------------------|--------------------------|
| 5226545        | 1             | 303000106    | 555     | 1/9/2020 0:00:00   | 1     | 1/1/1900 0:00:00  | 295765  | 303000106              | 113184             | 906838         | 110                | 25-10-2023 10:17:25     | 25-10-2023 10:17:25          | 303000106                 | 2/9/2020 0:00:00   | 10:43:16          | 2                           |                          |
|                |               |              |         |                    |       |                   |         |                        |                    |                |                    |                         |                              | 303000106                 | 30-05-2021 0:00:00 | 10:15:00          | 1                           | RECEPCION CONFORME       |
| 5163243        | 1             | 300613136    | 15342   | 1/11/2023 0:00:00  | 0     |                   |         | 300613136              | 50000001           | 906838         | 10                 | 16-10-2023 14:03:29     | 16-10-2023 14:03:29          | 300613136                 | 2/11/2023 0:00:00  | 10:00:00          | 2                           |                          |
| 5162912        | 1             | 300613106    | 15342   | 1/11/2023 0:00:00  | 12345 | 1/11/2023 0:00:00 | S/N     | 300613106              | 50000001           | 906838         | 10                 | 16-10-2023 12:41:47     | 16-10-2023 12:41:47          | 300613106                 | 2/11/2023 0:00:00  | 10:00:00          | 2                           |                          |
|                |               |              |         |                    |       |                   |         | 300613106              | 50000001           | 906838         | 10                 | 16-10-2023 12:43:22     | 16-10-2023 12:43:22          | 300613106                 | 2/11/2023 0:00:00  | 10:00:00          | 2                           |                          |
|                |               |              |         |                    |       |                   |         | 300613106              | 50000001           | 906838         | 10                 | 16-10-2023 12:43:55     | 16-10-2023 12:43:55          | 300613106                 | 2/11/2023 0:00:00  | 10:00:00          | 2                           |                          |
|                |               |              |         |                    |       |                   |         | 300613106              | 50000001           | 906838         | 10                 | 16-10-2023 12:44:35     | 16-10-2023 12:44:35          | 300613106                 | 2/11/2023 0:00:00  | 10:00:00          | 2                           |                          |
|                |               |              |         |                    |       |                   |         | 300613106              | 50000001           | 906838         | 10                 | 16-10-2023 12:45:57     | 16-10-2023 12:45:57          | 300613106                 | 2/11/2023 0:00:00  | 10:00:00          | 2                           |                          |
| 114036         | 1             | 300000111    | 999999  | 13-05-2021 0:00:00 | 0     |                   |         | 300000111              | 12345678           | B1142B22U1     | 2                  | 17-08-2022 8:44:44      | 17-08-2022 8:44:44           | 300000111                 | 30-05-2021 0:00:00 | 15:17:00          | 2                           | DESPACHADO - 9999999999  |
| 114035         | 1             | 300000106    | 279853  | 1/9/2020 0:00:00   | 0     | 1/1/1900 0:00:00  | 295765  | 300000106              | 113184             | 906838         | 110                | 4/8/2022 12:51:03       | 4/8/2022 12:51:03            | 300000106                 | 2/9/2020 0:00:00   | 10:43:16          | 2                           |                          |
|                |               |              |         |                    |       |                   |         |                        |                    |                |                    |                         |                              | 300000106                 | 2/9/2020 0:00:00   | 10:43:16          | 1                           |                          |
|                |               |              |         |                    |       |                   |         |                        |                    |                |                    |                         |                              | 300000106                 | 2/9/2020 0:00:00   | 10:43:16          | 1                           |                          |
|                |               |              |         |                    |       |                   |         |                        |                    |                |                    |                         |                              | 300000106                 | 2/9/2020 0:00:00   | 10:43:16          | 1                           |                          |
|                |               |              |         |                    |       |                   |         |                        |                    |                |                    |                         |                              | 300000106                 | 5/8/2022 0:00:00   | 9:00:00           | 1                           | JUAN PEREZ               |
|                |               |              |         |                    |       |                   |         |                        |                    |                |                    |                         |                              | 300000106                 | 30-05-2021 0:00:00 | 10:15:00          | 2                           | DESPACHADO - 9999999999  |
```

JSON

```jsx
[
  {
    "IdDistribucion": 5226545,
    "Rut_Proveedor": "1",
    "Doc_Cenabast": 303000106,
    "Factura": 555,
    "Fecha_Fac": "01-09-2020 0:00:00",
    "Guia": 1,
    "Fecha_Gui": "01-01-1900 0:00:00",
    "O_Trans": "000295765",
    "Detalles": [
      {
        "Doc_Cenabast": 303000106,
        "Articulo": "113184",
        "Lote": "906838",
        "Cantidad": 110,
        "FechaCreacion": "25-10-2023 10:17:25",
        "FechaActualizacion": "25-10-2023 10:17:25"
      }
    ],
    "Movimientos": [
      {
        "Doc_Cenabast": 303000106,
        "Fecha": "02-09-2020 0:00:00",
        "Hora": "10:43:16",
        "DescMovimiento": 2,
        "RecibidoPor": ""
      },
      {
        "Doc_Cenabast": 303000106,
        "Fecha": "30-05-2021 0:00:00",
        "Hora": "10:15:00",
        "DescMovimiento": 1,
        "RecibidoPor": "RECEPCION CONFORME"
      }
    ]
  },
  {
    "IdDistribucion": 5163243,
    "Rut_Proveedor": "1",
    "Doc_Cenabast": 300613136,
    "Factura": 15342,
    "Fecha_Fac": "01-11-2023 0:00:00",
    "Guia": 0,
    "Fecha_Gui": "",
    "O_Trans": "",
    "Detalles": [
      {
        "Doc_Cenabast": 300613136,
        "Articulo": "50000001",
        "Lote": "906838",
        "Cantidad": 10,
        "FechaCreacion": "16-10-2023 14:03:29",
        "FechaActualizacion": "16-10-2023 14:03:29"
      }
    ],
    "Movimientos": [
      {
        "Doc_Cenabast": 300613136,
        "Fecha": "02-11-2023 0:00:00",
        "Hora": "10:00:00",
        "DescMovimiento": 2,
        "RecibidoPor": ""
      }
    ]
  },
  {
    "IdDistribucion": 5162912,
    "Rut_Proveedor": "1",
    "Doc_Cenabast": 300613106,
    "Factura": 15342,
    "Fecha_Fac": "01-11-2023 0:00:00",
    "Guia": 12345,
    "Fecha_Gui": "01-11-2023 0:00:00",
    "O_Trans": "S/N",
    "Detalles": [
      {
        "Doc_Cenabast": 300613106,
        "Articulo": "50000001",
        "Lote": "906838",
        "Cantidad": 10,
        "FechaCreacion": "16-10-2023 12:41:47",
        "FechaActualizacion": "16-10-2023 12:41:47"
      },
      {
        "Doc_Cenabast": 300613106,
        "Articulo": "50000001",
        "Lote": "906838",
        "Cantidad": 10,
        "FechaCreacion": "16-10-2023 12:43:22",
        "FechaActualizacion": "16-10-2023 12:43:22"
      },
      {
        "Doc_Cenabast": 300613106,
        "Articulo": "50000001",
        "Lote": "906838",
        "Cantidad": 10,
        "FechaCreacion": "16-10-2023 12:43:55",
        "FechaActualizacion": "16-10-2023 12:43:55"
      },
      {
        "Doc_Cenabast": 300613106,
        "Articulo": "50000001",
        "Lote": "906838",
        "Cantidad": 10,
        "FechaCreacion": "16-10-2023 12:44:35",
        "FechaActualizacion": "16-10-2023 12:44:35"
      },
      {
        "Doc_Cenabast": 300613106,
        "Articulo": "50000001",
        "Lote": "906838",
        "Cantidad": 10,
        "FechaCreacion": "16-10-2023 12:45:57",
        "FechaActualizacion": "16-10-2023 12:45:57"
      }
    ],
    "Movimientos": [
      {
        "Doc_Cenabast": 300613106,
        "Fecha": "02-11-2023 0:00:00",
        "Hora": "10:00:00",
        "DescMovimiento": 2,
        "RecibidoPor": ""
      },
      {
        "Doc_Cenabast": 300613106,
        "Fecha": "02-11-2023 0:00:00",
        "Hora": "10:00:00",
        "DescMovimiento": 2,
        "RecibidoPor": ""
      },
      {
        "Doc_Cenabast": 300613106,
        "Fecha": "02-11-2023 0:00:00",
        "Hora": "10:00:00",
        "DescMovimiento": 2,
        "RecibidoPor": ""
      },
      {
        "Doc_Cenabast": 300613106,
        "Fecha": "02-11-2023 0:00:00",
        "Hora": "10:00:00",
        "DescMovimiento": 2,
        "RecibidoPor": ""
      },
      {
        "Doc_Cenabast": 300613106,
        "Fecha": "02-11-2023 0:00:00",
        "Hora": "10:00:00",
        "DescMovimiento": 2,
        "RecibidoPor": ""
      }
    ]
  },
  {
    "IdDistribucion": 114036,
    "Rut_Proveedor": "1",
    "Doc_Cenabast": 300000111,
    "Factura": 999999,
    "Fecha_Fac": "13-05-2021 0:00:00",
    "Guia": 0,
    "Fecha_Gui": "",
    "O_Trans": "",
    "Detalles": [
      {
        "Doc_Cenabast": 300000111,
        "Articulo": "12345678",
        "Lote": "B1142B22U1",
        "Cantidad": 2,
        "FechaCreacion": "17-08-2022 8:44:44",
        "FechaActualizacion": "17-08-2022 8:44:44"
      }
    ],
    "Movimientos": [
      {
        "Doc_Cenabast": 300000111,
        "Fecha": "30-05-2021 0:00:00",
        "Hora": "15:17:00",
        "DescMovimiento": 2,
        "RecibidoPor": "DESPACHADO - 9999999999"
      }
    ]
  },
  {
    "IdDistribucion": 114035,
    "Rut_Proveedor": "1",
    "Doc_Cenabast": 300000106,
    "Factura": 279853,
    "Fecha_Fac": "01-09-2020 0:00:00",
    "Guia": 0,
    "Fecha_Gui": "01-01-1900 0:00:00",
    "O_Trans": "000295765",
    "Detalles": [
      {
        "Doc_Cenabast": 300000106,
        "Articulo": "113184",
        "Lote": "906838",
        "Cantidad": 110,
        "FechaCreacion": "04-08-2022 12:51:03",
        "FechaActualizacion": "04-08-2022 12:51:03"
      }
    ],
    "Movimientos": [
      {
        "Doc_Cenabast": 300000106,
        "Fecha": "02-09-2020 0:00:00",
        "Hora": "10:43:16",
        "DescMovimiento": 2,
        "RecibidoPor": ""
      },
      {
        "Doc_Cenabast": 300000106,
        "Fecha": "02-09-2020 0:00:00",
        "Hora": "10:43:16",
        "DescMovimiento": 1,
        "RecibidoPor": ""
      },
      {
        "Doc_Cenabast": 300000106,
        "Fecha": "02-09-2020 0:00:00",
        "Hora": "10:43:16",
        "DescMovimiento": 1,
        "RecibidoPor": ""
      },
      {
        "Doc_Cenabast": 300000106,
        "Fecha": "02-09-2020 0:00:00",
        "Hora": "10:43:16",
        "DescMovimiento": 1,
        "RecibidoPor": ""
      },
      {
        "Doc_Cenabast": 300000106,
        "Fecha": "05-08-2022 0:00:00",
        "Hora": "09:00:00",
        "DescMovimiento": 1,
        "RecibidoPor": "JUAN PEREZ"
      },
      {
        "Doc_Cenabast": 300000106,
        "Fecha": "30-05-2021 0:00:00",
        "Hora": "10:15:00",
        "DescMovimiento": 2,
        "RecibidoPor": "DESPACHADO - 9999999999"
      }
    ]
  }
]
```
