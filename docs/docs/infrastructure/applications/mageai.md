# Mage.ai

:::info
[Mage.ai](https://github.com/mage-ai/mage-ai) will being used as a data pipeline for data sincronization.
:::

# SSH port forwarding

:::warning
Mage.ai does not have a public view.
:::

To access the Mage.ai application, a SSH port forwarding must be used between the [DEV server](../dev-server.md) and your local machine.

Once the VPN conection has been made, you can use the following command for tunneling port 6789:

```jsx
ssh nmella@10.8.0.44 -L 6789:10.8.0.44:6789
```

Then, just head up to `http://127.0.0.1:6789/`:

![Mage.ai Dashboard](/img/2024-02-23_09-54.png)