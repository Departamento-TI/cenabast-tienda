# Dev Server

## Resume

:::tip[IP]
The current Dev Server is a Ubuntu Server.\
External IP is `190.215.197.206`
:::

:::warning
The opened port are `80` and `443`.
:::

## SSH 

:::warning[VPN dependency]
SSH access **requires** VPN access.
:::

SSH Port: `22`\
Internal IP Address: `10.8.0.44`


## VPN

:::info[VPN requirement]
Please request a VPN access to Cenabast project manager.
:::

```jsx
sudo openfortivpn 190.215.197.202:10443 -u "username" -p "XXXXXXX"
```

## Docker

:::info
Container path is at `/root/containers/cenabast.gob.cl`
:::

### Useful commands

:::tip
Stop containers: `docker compose down`\
Start containers: `docker compose up -d`\
Check Logs containers: `docker compose logs -f`\
Log into container: `docker exec -it -u root e1cc /bin/bash` where 'e1cc' is the container ID.
:::

Running containers:

![runningcontainers](/img/2023-12-20_13-09.png)

### Docker Compose

:::danger
The following docker-compose.yml file might be outdated. The [actual file](https://github.com/Departamento-TI/cenabast-tienda/blob/develop/docker-compose.yml) is at the repo in the `develop` branch.
:::

<details>
  <summary>docker-compose.yml</summary>
  <div>
    <div>
    ```jsx
version: '3.7'
services:
  postgres:
    image: postgres:15-alpine
    environment:
      POSTGRES_USER: "cenabast"
      POSTGRES_PASSWORD: "yourpassword"
    ports:
      - "127.0.0.1:5432:5432"
    volumes:
      - 'postgres:/var/lib/postgresql/data'

  redis:
    image: redis:6.2-alpine
    ports:
      - "6379:6379"
    volumes:
      - 'redis:/data'

  web:
    depends_on:
      - 'postgres'
      - 'redis'
      - 'opensearch'
    build:
      context: .
      dockerfile: Dockerfile.development
    command: bash -c "rm -rf tmp/pids/server.pid && yarn install && yarn build && bundle exec rails s -b 0.0.0.0 -p 4000"
    ports:
      - '${DOCKER_HOST_WEB_PORT:-4000}:4000'
    volumes:
      - 'bundle_cache:/bundle'
      - '.:/app'
      - .env:/app/.env
    stdin_open: true
    tty: true
    environment:
      REDIS_URL: redis://redis:6379/0
      DB_HOST: postgres
      DB_PORT: 5432
      DISABLE_SPRING: 1

  worker:
    depends_on:
      - 'postgres'
      - 'redis'
      - 'opensearch'
    build:
      context: .
      dockerfile: Dockerfile.development
    command: bundle exec sidekiq -C config/sidekiq.yml
    volumes:
      - 'bundle_cache:/bundle'
      - '.:/app'
      - .env:/app/.env
    tty: true
    environment:
      REDIS_URL: redis://redis:6379/0
      DB_HOST: postgres
      DB_PORT: 5432
      DISABLE_SPRING: 1

  opensearch:
    image: opensearchproject/opensearch:2
    container_name: opensearch
    environment:
      discovery.type: single-node
      node.name: opensearch
      # Disables Security plugin
      DISABLE_SECURITY_PLUGIN: 'true'
      OPENSEARCH_JAVA_OPTS: "-Xms512m -Xmx512m"
    volumes:
      - opensearch-data:/usr/share/opensearch/data
    ports:
      - 9200:9200
      - 9600:9600

  opensearch-dashboards:
    image: opensearchproject/opensearch-dashboards:2
    container_name: opensearch-dashboards
    ports:
      - 5601:5601
    expose:
      - "5601"
    environment:
      # Disables security dashboards plugin in OpenSearch Dashboards
      DISABLE_SECURITY_DASHBOARDS_PLUGIN: 'true'
      OPENSEARCH_HOSTS: '["http://opensearch:9200"]'
    depends_on:
      - opensearch
  
  keycloak:
    build:
      context: .
      dockerfile: Dockerfile.keycloak
    image: keycloak:custom
    environment:
      KEYCLOAK_DATABASE_HOST: postgres
      KEYCLOAK_DATABASE_NAME: keycloak
      KEYCLOAK_DATABASE_USER: cenabast 
      KEYCLOAK_DATABASE_PASSWORD: yourpassword 
      KEYCLOAK_ADMIN: admin
      KEYCLOAK_ADMIN_PASSWORD: owwIZLI#6m65
      KEYCLOAK_HOSTNAME_ADMIN_URL: https://login-dev.cenabast.gob.cl/
      KEYCLOAK_HOSTNAME_URL: https://login-dev.cenabast.gob.cl/
      KEYCLOAK_PROXY: edge
    ports:
      - "8080:8080"
      - "8443:8443"
      - "9990:9990"
    command: ["start", "--https-key-store-file=/opt/keycloak/conf/server.keystore", "--https-key-store-password=pa55w0rd", "--optimized", "--db-url=jdbc:postgresql://postgres/keycloak", "--db-username=cenabast", "--db-password=yourpassword", "--proxy=edge", "--hostname-strict=false", "--hostname=login-dev.cenabast.gob.cl"]

volumes:
  postgres:
  opensearch-data:
  redis:
  bundle_cache:
    ```
    </div>
    
  </div>
</details>