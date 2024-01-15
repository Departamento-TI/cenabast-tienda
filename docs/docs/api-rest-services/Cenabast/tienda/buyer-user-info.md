# Buyer User info

## Resume

:::info
The following API returns the buyer user information.
:::

## Request

```jsx
GET {{HOST}}/interoperabilidad/servicios/v1/tienda/establecimiento/usuario/16338556' \
--header 'Authorization: Bearer {{token}}'
```

## Response

```jsx
{
    "rut_usuario": 16338556,
    "nombres": "PATRICIA",
    "apellido_paterno": "GUTIÉRREZ",
    "apellido_materno": "AGÜERO",
    "nombre_completo": "PATRICIA GUTIÉRREZ AGÜERO",
    "email": "patricia.gutierreza@redsalud.gob.cl",
    "telefono": "642335845",
    "movil": "972994022",
    "activo": true
}

```