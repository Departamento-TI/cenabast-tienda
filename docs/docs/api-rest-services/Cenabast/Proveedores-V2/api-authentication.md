---
title: API Authentication
published: true
date: 2023-11-07T22:00:56.156Z
editor: markdown
dateCreated: 2023-11-07T22:00:56.156Z
---

# API Authentication 

:::info
The following credentials only work on the DEV instance.
:::

**Request**:

```jsx
POST {{HOST}}/WebApi2/api/v2/login/authenticate \
  --data '{
  "Username": "1",
  "Password": "a"
}'
```

**Response**:

```jsx
"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjEiLCJyb2xlIjoiUHJvdmVlZG9yIiwibmJmIjoxNjk5Mzk0MzEwLCJleHAiOjE2OTkzOTYxMTAsImlhdCI6MTY5OTM5NDMxMCwiaXNzIjoiaHR0cDovL2xvY2FsaG9zdC8iLCJhdWQiOiJodHRwOi8vbG9jYWxob3N0LyJ9.kqyPlLeFGPKLT_Ss2fvD21wMvH_AEo1fbMC4jWtdtmg"
```



