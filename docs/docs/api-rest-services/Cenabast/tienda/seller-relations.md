# Seller User Relations

## Resume

:::info
The following API returns all the related Companies for a particular Seller. 
:::

## Request

```jsx
GET {{HOST}}/interoperabilidad/tienda/api/v1/usuario/55555555/proveedor' \
--header 'Authorization: Bearer {{token}}'

```

## Response

```jsx
{
    "code": 200,
    "isSuccessStatusCode": true,
    "content": {
        "rutUsuario": "55555555",
        "rutProveedor": "76191389",
        "nombreProveedor": "SERVICIOS Y MAQUILA SERVICE LTDA.  ",
        "activo": true
    }
}
```