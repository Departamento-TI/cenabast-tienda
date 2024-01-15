---
title: Request Period
published: true
date: 2023-11-06T15:16:10.656Z
editor: markdown
dateCreated: 2023-11-06T15:16:10.656Z
---

# Resume

This service returns the latest open accountable period. It should be given the "Cost Center" value (aka "Area Transaccional")


# API Example

**Request**

```jsx
curl --request POST \
  --url https://www.sigfe.gob.cl/cxf/public/chileCompra/buscarPeriodo \
  --header 'Authorization: Basic aW50ZXJNUFNJR0ZFOnNaMDBNNE5C' \
  --header 'content-type: application/json' \
  --data '{
  "areaTrx": "1646008"
}'
```

**Response: **

```json
{
  "areaTrx": "1646008",
  "periodo": 10,
  "ejercicio": 2023
}
```