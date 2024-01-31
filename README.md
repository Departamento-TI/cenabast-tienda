# Cenabast Ecommerce

Cenabast B2B project:

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


## Local Instalation

Project template generated based on [Spree Starter](https://github.com/spree/spree_starter)

#### Install required tools and dependencies:

* [Docker](https://www.docker.com/community-edition#/download)

#### Run setup script

```bash
bin/setup-docker
```

#### (Optional) Import sample data such as products, categories, etc

```bash
docker compose run web rake spree_sample:load
```

### (Optional) create vendor sample (for spree multi vendor) data

```bash
docker compose run web bundle exec rake spree_multi_vendor:sample:create
```

#### After the setup is finished, launch the webserver with:

```bash
bin/start-docker
```

By default, webserver will be exposed on port 4000.
Opensearch dashboard will be exposed on port 5601.

### Install tools for style/security checks locally and to run Git hooks (Overcommit)

```
gem install overcommit

gem install rubocop -v 1.57.2
gem install rubocop-performance -v 1.20.2
gem install rubocop-rails -v 2.22.1
gem install brakeman -v 6.1.1
gem install bundle-audit -v 0.1.0
gem install slim_lint -v 0.26.0

overcommit --install
```

## Opensearch Dashboard simple usage

The default URL should be
http://localhost:5601/

Default credentials are

```
username: admin
password: admin
```

In order to be able to browse data, create an index pattern for `spree_variants_development` on:

http://localhost:5601/app/management/opensearch-dashboards/indexPatterns

Then you can use Data Explorer > Discover to view existing records:

http://localhost:5601/app/data-explorer/discover

## Run tests

```
bundle exec rspec
```

## Run rubocop

```
bundle exec rubocop --parallel
```

## Branching strategy

### Create Short-Lived Branch:

Create a short-lived branch based from `main` for a specific feature or bug fix.

If its based on a JIRA issue, use the JIRA prefix of the feature for naming the branch:

```
<JIRA issue number(s)>-<lowercase-description-of-branch>
```

Some examples:
```
PE188-1-initalize-project

PE188-4-5-6-add-base-instalation-configuration
```

Then, start your branch like this:
```
git checkout main
git pull origin main
git checkout -b <your-branch>
# Begin working on your feature/fixes
```

### Frequent Integration:

Frequent integration with the main branch ensures continuous testing and validation.

```
git checkout main
git pull origin main
git checkout <your-branch>
git rebase main
```

### Pull Request and Code Review:

When the branch is ready to merge, a Pull request is lifted targeting to the `main` branch.
Developers conduct code reviews before merging into the main branch.

Branch must pass the pipeline validations.
And a corresponding test coverage must be added into the branch.

## Useful links

### Mercado publico quotation detail (Has documentation for proyect requirements)
https://conveniomarco.mercadopublico.cl/software2022/publicquotes/requestforquote/view/id/39700/

### JIRA
https://linets.atlassian.net/jira/software/projects/PE188