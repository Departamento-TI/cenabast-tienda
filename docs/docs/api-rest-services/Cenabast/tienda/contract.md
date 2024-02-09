# Contract

## Request

:::tip
Get contracts for [ZGEN](../../../business/products.mdx) product 100000022.
:::

```jsx
GET '{{host}}/interoperabilidad/servicios/v1/tienda/contratos/100000022' \
--header 'Authorization: Bearer {{token}}'

```

## Response

```jsx
[
    {
        "PedidoCompra": "4500028056",
        "idMercadoPublico": "621-746-SE22",
        "ZGEN": "100000022",
        "NombreZGEN": "ACIDO FOLICO 5MG CM/CM REC",
        "ZCEN": "500012494",
        "NombreZCEN": "FOLACID CM 5 MG CAJ 1000 CM",
        "Cantidad": 1.000000000000000e+003,
        "UnidadVenta": "CAJ",
        "Unidad": "UN",
        "NombreProveedor": "ITF LABOMED FARMACEUTICA LTDA.",
        "RutProveedor": "96884770-8",
        "ValorNeto": 1.000000000000000e+004,
        "Valoriva": 1.900000000000000e+003,
        "ValorTotal": 1.190000000000000e+004,
        "ValorComision": 1.000000000000000e+002,
        "FechaInicialContrato": "202212",
        "FechaFinalContrato": "202305",
        "Centro": "5000"
    },
    {
        "PedidoCompra": "4500028056",
        "idMercadoPublico": "621-746-SE22",
        "ZGEN": "100000022",
        "NombreZGEN": "ACIDO FOLICO 5MG CM/CM REC",
        "ZCEN": "500016002",
        "NombreZCEN": "FOLACID CM 5 MG CAJ 90 CM",
        "Cantidad": 9.000000000000000e+001,
        "UnidadVenta": "CAJ",
        "Unidad": "UN",
        "NombreProveedor": "ITF LABOMED FARMACEUTICA LTDA.",
        "RutProveedor": "96884770-8",
        "ValorNeto": 9.000000000000000e+002,
        "Valoriva": 1.710000000000000e+002,
        "ValorTotal": 1.071000000000000e+003,
        "ValorComision": 9.000000000000000e+000,
        "FechaInicialContrato": "202212",
        "FechaFinalContrato": "202305",
        "Centro": "5000"
    },
    {
        "PedidoCompra": "4500029593",
        "idMercadoPublico": "621-1256-SE22",
        "ZGEN": "100000022",
        "NombreZGEN": "ACIDO FOLICO 5MG CM/CM REC",
        "ZCEN": "500012494",
        "NombreZCEN": "FOLACID CM 5 MG CAJ 1000 CM",
        "Cantidad": 1.000000000000000e+003,
        "UnidadVenta": "CAJ",
        "Unidad": "UN",
        "NombreProveedor": "ITF LABOMED FARMACEUTICA LTDA.",
        "RutProveedor": "96884770-8",
        "ValorNeto": 1.400000000000000e+004,
        "Valoriva": 2.660000000000000e+003,
        "ValorTotal": 1.666000000000000e+004,
        "ValorComision": 1.400000000000000e+002,
        "FechaInicialContrato": "202306",
        "FechaFinalContrato": "202411",
        "Centro": "5000"
    },
    {
        "PedidoCompra": "4500029593",
        "idMercadoPublico": "621-1256-SE22",
        "ZGEN": "100000022",
        "NombreZGEN": "ACIDO FOLICO 5MG CM/CM REC",
        "ZCEN": "500016002",
        "NombreZCEN": "FOLACID CM 5 MG CAJ 90 CM",
        "Cantidad": 9.000000000000000e+001,
        "UnidadVenta": "CAJ",
        "Unidad": "UN",
        "NombreProveedor": "ITF LABOMED FARMACEUTICA LTDA.",
        "RutProveedor": "96884770-8",
        "ValorNeto": 1.260000000000000e+003,
        "Valoriva": 2.394000000000000e+002,
        "ValorTotal": 1.499400000000000e+003,
        "ValorComision": 1.260000000000000e+001,
        "FechaInicialContrato": "202306",
        "FechaFinalContrato": "202411",
        "Centro": "5000"
    },
    {
        "PedidoCompra": "4500029593",
        "idMercadoPublico": "621-1256-SE22",
        "ZGEN": "100000022",
        "NombreZGEN": "ACIDO FOLICO 5MG CM/CM REC",
        "ZCEN": "500016290",
        "NombreZCEN": "FOLACID 5 MG CAJ 30 CM",
        "Cantidad": 3.000000000000000e+001,
        "UnidadVenta": "CAJ",
        "Unidad": "UN",
        "NombreProveedor": "ITF LABOMED FARMACEUTICA LTDA.",
        "RutProveedor": "96884770-8",
        "ValorNeto": 4.200000000000000e+002,
        "Valoriva": 7.980000000000000e+001,
        "ValorTotal": 4.998000000000000e+002,
        "ValorComision": 4.200000000000000e+000,
        "FechaInicialContrato": "202306",
        "FechaFinalContrato": "202411",
        "Centro": "5000"
    }
]
```
