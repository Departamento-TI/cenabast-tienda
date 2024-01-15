# Seller User Relations

## Resume

:::info
The following API returns all the related Companies for a particular Seller. 
:::

## Request

```jsx
GET {{HOST}}/interoperabilidad/servicios/v1/tienda/usuario/8962580/proveedor' \
--header 'Authorization: Bearer {{token}}'

```

## Response

```jsx
{
    "rut_usuario": "8962580",
    "rut_proveedor": "76191389",
    "nombre_proveedor": "SERVICIOS Y MAQUILA SERVICE LTDA.  ",
    "activo": true
}
```