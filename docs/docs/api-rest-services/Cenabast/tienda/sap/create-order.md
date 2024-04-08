# Create Order

## Resume

:::info
Dev HOST: <kbd>testaplicacionesweb.cenabast.cl:7001</kbd>
:::

## Request

```jsx
POST '{{HOST}}/interoperabilidad/tienda/api/v1/pedido' \
--data '{
  "RutSolicitante": "12345678-9",
  "DetalleProductos": [
  {
    "DocumentoCompra": 4500024662,
    "CodigoOcChilecompra": "621-222-SE21",
    "CodigoMaterial": 500006843,
    "CantidadSolicitada": 10,
    "CodigoDestinatario": 20457,
    "PuertoDescarga": "Puerto A",
    "FechaEntrega": "2024-03-21T00:00:00"
  }
]
}'
```

## Response

```jsx
{
  "code": 200,
    "isSuccessStatusCode": true,
    "content": [
    {
      "pedidoId": 25,
      "fechaCreacion": "2024-04-05T14:59:15.0426499-03:00",
      "zcen": "500006843",
      "pedidoVentaId": 55005002
    }
  ]
}
```
