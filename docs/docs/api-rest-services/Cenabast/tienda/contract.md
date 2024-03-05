# Contract

## Request

:::tip
Get contracts for [ZGEN](../../../business/products.mdx) product 100000022.
:::

```jsx
GET '{{host}}/interoperabilidad/tienda/api/v1/materiales/contratos/500016333' \
--header 'Authorization: Bearer {{token}}'

```

## Response

```jsx
{
    "code": 200,
    "isSuccessStatusCode": true,
    "content": [
        {
            "pedidoCompra": "4500029367",
            "idMercadoPublico": "621-836-LR22",
            "ocMercadoPublico": "621-1260-SE22",
            "zgen": "100001143",
            "nombreZGEN": "PARACETAMOL 500 MG CM/CM REC",
            "zcen": "500016333",
            "nombreZCEN": "PARACETAMOL 500 MG CAJ 1000 CM",
            "cantidad": 1000.00,
            "unidadVenta": "CAJ",
            "unidad": "UN",
            "nombreProveedor": "PHARMA NETWORK SPA",
            "rutProveedor": "76857605-K",
            "valorNeto": 8990.00,
            "valorIVA": 1708.10,
            "valorTotal": 10698.10,
            "valorComision": 89.90,
            "fechaInicialContrato": "202303",
            "fechaFinalContrato": "202408",
            "centro": 5000
        }
    ]
}
```
