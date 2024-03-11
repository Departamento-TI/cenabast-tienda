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

## Ports

:::danger[Ports opening request]
The following ports should be allowed: `22`, `80`, `443`, `587`.
:::

## Docker

:::info
Container path is at `/root/containers/cenabast.gob.cl`
:::

### Useful commands

:::info[Video intro]
Quick video intro => https://youtu.be/lJkh3XUYrRE
:::

:::tip[Login to Dev Server]
Login: `ssh username@10.8.0.44`
Change to root user: `sudo su`
:::

:::tip[Update code]
Go to working directory: `cd /root/containers/cenabast.gob.cl`\
Pull main branch: `git pull origin main`
:::

:::info[Rebuild]
Rebuild container: `docker-compose build --no-cache`\
Store Bunlde install: `docker compose run web bundle install`\
Store DB migrations: `docker compose run web rake db:migrate`\
Relauch new containers: `docker compose up -d --build --force-recreate --no-deps`
:::

:::tip[Other]
Stop containers: `docker compose down`\
Start containers: `docker compose up -d`\
Check Logs containers: `docker compose logs -f`\
Log into container: `docker exec -it -u root e1cc /bin/bash` where 'e1cc' is the container ID.
:::

Running containers:

![runningcontainers](/img/2023-12-20_13-09.png)

### Docker Compose

:::danger
Check the [docker-compose.yml](https://github.com/Departamento-TI/cenabast-tienda/blob/develop/docker-compose.yml).
:::