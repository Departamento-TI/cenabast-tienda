# Troubleshooting

## Create Admin user

:::info
Assign the **admin** role to a user using the user RUT value
:::

Log into the rails console:

```jsx
docker compose run web rails c
```

Search for the user. If RUT is 44.444.444-4, use `444444444`:

```jsx
u = Spree::User.find_by(run: '444444444')
```

The search for the **admin** role and assign the role to the user:

```jsx
role = Spree::Role.find_by(name: 'admin')
u.spree_roles << role
u.save
```

