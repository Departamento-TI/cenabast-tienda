---
title: WebAPI V1 authentication
published: true
date: 2023-11-07T22:02:59.309Z
editor: markdown
dateCreated: 2023-11-07T22:02:59.309Z
---

# Resume
:::warning
Dev HOST: <kbd>testaplicacionesweb.cenabast.cl:7001</kbd>
:::

# API Authentication

> **Request**

```jsx
POST https://{{HOST}}/proyectosti/apiusuarios/v1/usuario/login \
  --data '    {
      "user": "tienda",
      "password": "tienda#2024"
    }'
```

> **Response**:

```jsx
{
  "token": "eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9zaWQiOiIxOSIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDkvMDkvaWRlbnRpdHkvY2xhaW1zL2FjdG9yIjoiVXNlciIsImV4cCI6MTY5OTM5Nzk5MSwiaXNzIjoiQ0VOQUJBU1QtUFJPWS1USSIsImF1ZCI6Imh0dHBzOi8vbG9jYWxob3N0OjcxMTUifQ.wgO9KRIb-G1X9xhzOOqiQ2-7vxPeZgkRU3slrHvRbjY"
}
```