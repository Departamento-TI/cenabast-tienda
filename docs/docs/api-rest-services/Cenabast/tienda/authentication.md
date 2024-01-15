# API authentication

## Resume

:::info
Dev HOST: <kbd>testaplicacionesweb.cenabast.cl:7001</kbd> 
:::

## Request

```jsx
POST '{{HOST}}/interoperabilidad/servicios/v1/usuario/login' \
--data '{
  "user": "tienda",
  "password": "tienda#2024"
}'
```

## Response

```jsx
{"token":"eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9zaWQiOiIxOSIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDkvMDkvaWRlbnRpdHkvY2xhaW1zL2FjdG9yIjoiVXNlciIsImV4cCI6MTcwNTM1MTgzMywiaXNzIjoiVElFTkRBLVRFU1QtVEkiLCJhdWQiOiJodHRwczovL3Rlc3RhcGxpY2FjaW9uZXN3ZWIuY2VuYWJhc3QuY2w6NzAwMSJ9.0QklvN0urZMnlZOlmyf8WBOyd5CIIpeLQyL6P9XiOj8"}
```