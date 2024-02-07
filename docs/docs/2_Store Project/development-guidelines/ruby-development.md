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

## Development of views

We are using [ViewComponent](https://github.com/viewcomponent/view_component) in order to build reusable pieces of user interface.
Creation of new views is encoraged to be created using a ViewComponent.

* A ViewComponent should have the bare minimum business logic possible in order to work. Consider sending business values as primitives via parameters in the initialization.
* Those components that are part of the UI kit and can be reused in multiple parts of the site should reside on the `components/common` folder. More specific components can be created in other subfolders.
  * As possible, components should match how they are defined in the [Figma prototypes](../draft-wireframes-prototyping.md). In look and in how the parameters are passed.
* Is recommended to add a [LookBook](https://github.com/ViewComponent/lookbook) preview in order to easily preview the component.
* [TailwindCSS](https://github.com/rails/tailwindcss-rails) declaration of styles is encouraged. Use utility CSS clases to define component look rather than creating custom and/or semantic CSS.
* Write component tests to manage behaviour of every view component.

### Related documentation

* [ViewComponent Documentation](https://viewcomponent.org/)
* [Lookbook Documentation](https://lookbook.build/guide)
* [TailwindCSS Documentation](https://tailwindcss.com/docs)

:::warning[TailwindCSS]
[TailwindCSS](https://github.com/rails/tailwindcss-rails) is a utility-first CSS framework packed with classes like flex, pt-4, text-center and rotate-90 that can be composed to build any design, directly in your markup.

CSS Utility classes can help to reduce the complexity required to understand Semantical CSS in long running proyects.

More information about the problematic can be found here:

https://adamwathan.me/css-utility-classes-and-separation-of-concerns/
:::

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
