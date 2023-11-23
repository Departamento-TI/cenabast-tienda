---
title: Platform Suggestion
published: true
date: 2023-11-11T14:00:23.163Z
editor: markdown
dateCreated: 2023-10-30T15:15:56.904Z
---

# Resume
:::tip
The following design is an architecture **proposal** which can be modified or adapted.
:::

# Plataform Suggestion

:::tip
👉 Start from latest [Spree Commerce vesion](https://github.com/spree/spree) (4.6.2).\
👉 Use [Spree Starter Dockerize](https://github.com/spree/spree_starter) version.\
👉 Use [Spree Legacy frontend](https://github.com/spree/spree_rails_frontend) Gem.\
👉 Use [Spree Multi-Vendor](https://github.com/spree-contrib/spree_multi_vendor) Gem.\
:::



**Missing features:**

:::warning
⚠️ **Single Sing On (SSO)** Gem (openid connect or SAML ?)\
⚠️ Custom integration with <kbd>Clave Unica</kbd>, local Identity Provider (OpenID Connect)\
⚠️ B2B logic.\
⚠️ Custom Checkout Workflows\
⚠️ Custom Catalog\
⚠️ Custom Cart Management\
:::

## Logic Complexities

:::tip
👉 Cart should be related to SubOrganizations (aka "Destinatario").\
👉 Cart logic will be different depending on the [Type of Purchase](../functionalities/purchase-type.md).\
👉 Product Catalog should be related to [Type or Purchase](../functionalities/purchase-type.md) (aka "Canal").\
👉 Checkout workflow will be different depending on the [Type of Purchase](../functionalities/purchase-type.md).\
:::


# Data Management

:::danger
⚠️ All Data will be provided by **third party services** APIs. User, Products, Vendors.\
⚠️ We will probably need to implement different sicronization methods (daily, on the fly, etc).\
⚠️ Each API has it's own authentication method, cache policies, etc. <mark>**Maybe we should implement and API Gateway ?**</mark>\
:::

:::warning
In order to Dockerize the application, we need to save all assets (images) in an external storage, most probably a S3 bucket.
:::

# Queue Management

:::note
⚠️ In the Checkout flow, we will need to integrate with external services for purchase order creation, budget validation, etc. We need to implement a nice Queue flow for jobs management.
:::

