---
title: Dev. Guidelines
published: true
date: 2023-11-07T16:11:59.721Z
editor: markdown
dateCreated: 2023-11-07T16:11:59.720Z
---

# Dev Guidelines

:::warning
Rubocop will be in charge for review all PRs. 🧐
:::

## Contribution Guidelines

Devs should follow the recommended [Spree customization logic](https://dev-docs.spreecommerce.org/customization/logic) when extending existing Spree behaviour.

Consider using [Reusable abstractions](https://docs.gitlab.com/ee/development/reusing_abstractions.html) like Service Classes, and Finders (amongst others).

Ideally, code must be aligned towards the Spree and RoR framework design guidelines. And only create new or different structures as it becames necessary.

## Linting

All contributions must pass the lint analysis provided by the configured tools:
  * Rubocop
  * Bundle-audit
  * brakeman
  * slim-lint

We recomed configuring your IDE to check those in real time.

If overcommit is configured, some of those tests can be run as a git hook in the pre-commit or pre-push steps.

## Testing

All new features added in a contribution, should be tested using Rspec.

Depending on the feature added, model/controller/request/behaviour/etc tests could be written.
