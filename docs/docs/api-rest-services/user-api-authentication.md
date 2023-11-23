---
title: User API authentication
published: true
date: 2023-11-07T22:02:59.309Z
editor: markdown
dateCreated: 2023-11-07T22:02:59.309Z
---

# Reseme
:::warning
Pending
:::

# API Authentication 2

> **Request**

```ruby
curl --request POST \
  --url https://testaplicacionesweb.cenabast.cl:7001/proyectosti/apiusuarios/v1/usuario/login \
  --header 'Authorization: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjEiLCJyb2xlIjoiUHJvdmVlZG9yIiwibmJmIjoxNjk5MzkzMzQ2LCJleHAiOjE2OTkzOTUxNDYsImlhdCI6MTY5OTM5MzM0NiwiaXNzIjoiaHR0cDovL2xvY2FsaG9zdC8iLCJhdWQiOiJodHRwOi8vbG9jYWxob3N0LyJ9.jJqWnXQlFImiunTFNF3BZU1S607NYFYkJ4j32w5_2mQ' \
  --header 'content-type: application/json' \
  --data '    {
      "user": "tienda",
      "password": "tienda#2024"
    }'
```

> **Response**:

```ruby
{
  "token": "eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9zaWQiOiIxOSIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDkvMDkvaWRlbnRpdHkvY2xhaW1zL2FjdG9yIjoiVXNlciIsImV4cCI6MTY5OTM5Nzk5MSwiaXNzIjoiQ0VOQUJBU1QtUFJPWS1USSIsImF1ZCI6Imh0dHBzOi8vbG9jYWxob3N0OjcxMTUifQ.wgO9KRIb-G1X9xhzOOqiQ2-7vxPeZgkRU3slrHvRbjY"
}
```