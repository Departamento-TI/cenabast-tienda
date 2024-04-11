# Cancel Order

## Resume

:::info
Dev HOST: <kbd>testaplicacionesweb.cenabast.cl:7001</kbd>
:::

## Request

```jsx
PATCH '{{HOST}}/interoperabilidad/tienda/api/v1/pedido/CancelarPedido/{{PV}}'
```
Donde PV = id de pedido de venta SAP

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
