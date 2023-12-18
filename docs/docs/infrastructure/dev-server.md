# Dev Server

:::tip[IP]
The current Dev Server is a Ubuntu Server.\
External IP is `190.215.197.206`
:::

:::warning
The only opened port is `443`.
:::

## SSH 

SSH Port: `22`\
Internal IP Address: `10.8.0.44`


## VPN

:::warning[VPN requirement]
For SSH access, VPN access is mandatory. Please request a VPN access to Cenabast admin.
:::

```jsx
sudo openfortivpn 190.215.197.202:10443 -u "nmella" -p "XXXXXXX"
```