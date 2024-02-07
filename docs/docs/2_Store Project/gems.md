---
title: Gems
published: true
date: 2024-01-31T15:11:59.721Z
editor: markdown
dateCreated: 2024-01-31T15:11:59.721Z
---

# Gems

Dependancies used in the project

* [Spree](https://github.com/spree/spree) for e-commerce base
* [Spree Starter](https://github.com/spree/spree_starter) for project template
* [Spree Rails Frontend](https://github.com/spree/spree_rails_frontend) for storefront
* [Spree Multi Vendor](https://github.com/spree-contrib/spree_multi_vendor) for Marketplace multiprovider structure
* [searchkick](https://github.com/ankane/searchkick) for store search bar.
* [PostgreSQL](https://www.postgresql.org/) for relational database.
* [Sidekiq](https://github.com/sidekiq/sidekiq) for background jobs.
* [Redis](https://redis.io/) for cache and queues managenment.
* [Rspec](https://rspec.info/) for unit testing.
* [Rubocop](https://github.com/rubocop/rubocop) for code style linting.
* [Brakeman](https://github.com/presidentbeef/brakeman) for static analyze of security vulnerabilities
* [Slim-Lint](https://github.com/sds/slim-lint) for linting of Slim templates
* [Overcommit](https://github.com/sds/overcommit) for management of Git hooks used in the project
* [Tailwind](https://github.com/rails/tailwindcss-rails) CSS Framework
* [ViewComponent](https://github.com/viewcomponent/view_component) for building reusable and encapsulated view components on RoR
* [LookBook](https://github.com/ViewComponent/lookbook) as a component browser for the developers

## Proposed gems

These gems are not yet installed, but they can be useful for developing some features.

### [OmniAuth](https://github.com/omniauth/omniauth)

OmniAuth is a flexible authentication system utilizing Rack middleware.
Works nicely with Devise, which is an already installed dependacy used for User authentication/model.

Using the [OAuth2 Strategy](https://github.com/omniauth/omniauth-oauth2) or [Keycloak Strategy](https://github.com/ccrockett/omniauth-keycloak) we could easily integrate the ClaveUnica authentication system onto the platform.


### [Trix](https://github.com/basecamp/trix)

Trix is a WYSIWYG editor for writing messages, comments, articles, and lists—the simple documents.

Trix could be used as a replacement or betterment to edit product information, landing texts, and other contents presented to the Cenabast users.

### [Prawn](https://github.com/prawnpdf/prawn)

Prawn is a pure Ruby PDF generation library that provides a lot of great functionality while trying to remain simple and reasonably performant.

Prawn could be useful to generate PDF information of Order Sales, Repors or other store elements.

### [RestClient](https://github.com/rest-client/rest-client)

RestClient is a simple HTTP and REST client for Ruby, inspired by microframework syntax for specifying actions.

Althrough no gem is required for handling HTTP petitions, using RestClient DSL can help to make more expressive services and easier to understand.

### [Spree Analytics Trackers](https://github.com/spree-contrib/spree_analytics_trackers)

Spree extension that adds support for [Google Analytics Enhanced Ecommerce](https://developers.google.com/analytics/devguides/collection/analyticsjs/enhanced-ecommerce) and [Segment Ecommerce](https://segment.com/docs/connections/spec/ecommerce/v2/) tracking to Spree Commerce stores.

Would allows us to understand more about user behaviour.

### [NewRelic](https://github.com/newrelic/newrelic-ruby-agent)

New Relic Ruby agent allows to connect the application to the NewRelic APM platform. Facilitating developers to identify and solve performance issues.

Although some other APM solutions were considered already (sentry, scout_apm), we consider that NewRelic is a powerful solution, albeit is can be a bit more expensive.