---
title: B2B module
published: true
date: 2023-10-26T20:07:21.501Z
editor: markdown
dateCreated: 2023-10-26T16:12:31.748Z
---

### Resume
:::tip
Users will log into the Store using their personal Credentials.\
Once users are logged in, the [User API Service](../../api-rest-services/users.md) will return all related information to the user.
:::

The following image shows a typical user/organization structure:

![Image Structure](/2023-10-26_17-05.png)

The above structure, we should be able to view it in the top header at all times:

![header](/img/2023-12-19_09-41.png)


# B2B Business Logic

:::danger[Organizations]
👉 Logged Users belongs to **organizations** \
(User could belong to multiple organizations.) (Ex. Apple, Google, IBM, Microsoft)\
👉 Each organizations has **sub-organizations**.\
(For Google, it could be like: Youtube, Google Cloud, Android, etc)\
👉 Each sub-organizations **<mark>can have different Cost Centers</mark>**\
(For Youtube, it could be like: Finance, IT Department, HR Department, etc).
:::

:::warning[Shipping Address]
👉 Each Sub-Organization can have different Shipping Address.\
:::

# User

For each user, we will need to the following data, which should be fetchend from the [User API Service](../../api-rest-services/users.md)

```jsx
User First Name
User Last Name
User RUT (primary key)
User email
```


# Organizations (aka: "Solicitante")

:::warning
⚠️ Pending: User/Organization relation key.
:::

For Organizations, we will need the following data:

```ruby
Organization Name
Organization RUT
Organization Address
Organization SAP ID
Organization DCCP ID
```




# Sub-Organization (aka: "Destinatario")

:::warning
⚠️ **Pending**: Organization/Sub-Organization relation key.
:::

For Sub-Organizations, we will need the following data:

```ruby
Sub-Organization Name
Sub-Organization RUT
Sub-Organization Address
Sub-Organization SAP ID
Sub-Organization DCCP ID
```

# Cost Centers (aka: "Unidad de Compra")

:::warning
⚠️ **Pending**: Sub-Organization/Cost Center relation key.
:::

For Cost Centers, we will need the following data:

```ruby
Cost Center Name
Cost Center DCCP ID
Cost Center DIPRES ID
```

# Shipping Address (aka: "Puerto de descarga")

For each Shipping Address, we will need:

```ruby
Street Name
Street Number
Region (or State)
Comuna (or County)
Phone Number
Shipping Address Contact First Name
Shipping Address Contact Last Name
Shipping Address Contact Email
Shipping Adresss Contact Phone Number
``` 