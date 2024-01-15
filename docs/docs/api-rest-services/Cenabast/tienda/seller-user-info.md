# Seller User Info

## Resume

:::info
The following API returns the Seller User information.
:::

## Request

```jsx
GET {{HOST}}/interoperabilidad/servicios/v1/tienda/proveedor/usuario/8895313' \
--header 'Authorization: Bearer {{token}}'

```

## Response

```jsx
{
    "rut_usuario": 8895313,
    "nombres": "MICHEL",
    "apellido_paterno": "BENOIS ",
    "apellido_materno": "JIMENEZ",
    "nombre_completo": "MICHEL BENOIS  JIMENEZ",
    "email": "michel.benois@cl.nestle.com",
    "telefono": "223375275",
    "movil": "",
    "activo": true
}
```