# Seller User Info

## Resume

:::info
The following API returns the Seller User information.
:::

## Request

```jsx
GET {{HOST}}/interoperabilidad/tienda/api/v1/proveedor/usuario/55555555' \
--header 'Authorization: Bearer {{token}}'

```

## Response

```jsx
{
    "code": 200,
    "isSuccessStatusCode": true,
    "content": {
        "rutUsuario": 55555555,
        "dv": "5",
        "nombres": "Prueba",
        "apellidoPaterno": "Prueba",
        "apellidoMaterno": "Prueba",
        "nombreCompleto": "Prueba Prueba Prueba",
        "email": "pedroz21@gmail.com",
        "telefono": "",
        "movil": "",
        "activo": true
    }
}
```