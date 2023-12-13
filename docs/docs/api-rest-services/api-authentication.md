---
title: API Authentication
published: true
date: 2023-11-07T22:00:56.156Z
editor: markdown
dateCreated: 2023-11-07T22:00:56.156Z
---

# Resume

API authentication in DEV URL



# API Authentication 

**Request**:

```jsx
curl --request POST \
  --url https://testaplicacionesweb.cenabast.cl:7001/WebApi2/api/v2/login/authenticate \
  --header 'content-type: application/json' \
  --data '{
  "Username": "1",
  "Password": "a"
}'
```

**Response**:

```jsx
"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjEiLCJyb2xlIjoiUHJvdmVlZG9yIiwibmJmIjoxNjk5Mzk0MzEwLCJleHAiOjE2OTkzOTYxMTAsImlhdCI6MTY5OTM5NDMxMCwiaXNzIjoiaHR0cDovL2xvY2FsaG9zdC8iLCJhdWQiOiJodHRwOi8vbG9jYWxob3N0LyJ9.kqyPlLeFGPKLT_Ss2fvD21wMvH_AEo1fbMC4jWtdtmg"
```



