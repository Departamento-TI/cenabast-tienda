---
title: Forecast 
published: true
date: 2023-11-06T15:18:41.196Z
editor: markdown
dateCreated: 2023-11-06T15:18:41.196Z
---

# Resume

:::danger
La demanda programada sólo existe para los productos genéricos [ZGEN](../../../business/products.mdx)
:::

# Demanda Programada

:::warning
De la respuesta de esta API, sólo se deben considerar los productos que comienza con 10000*
:::

## Request

```jsx
GET '{{host}}}}/interoperabilidad/servicios/v1/tienda/demandaprogramada/{{rut-solicitante}}/{{rut-destinatario}}/{{mes}}/{{año}}' \
--header 'Authorization: Bearer {{token}}'
```


## Response

:::tip
El siguiente ejemplo muestra algunos registros para la demanda programada de agosto 2024.
```jsx 
GET '{{HOST}}/interoperabilidad/servicios/v1/tienda/demandaprogramada/69070900/200024/08/2024' \
--header 'Authorization: Bearer {{token}}'
```
:::

```jsx
[
    {
        "Oferta": "0115820301",
        "Posicion": "000010",
        "RutSolicitante": "0069070900",
        "NombreSolicitante": "MUNICIPALIDAD MAIPU",
        "RutDestinatario": "0000200024",
        "NombreDestinatario": "CESFAM CARLOS GODOY",
        "OrganizacionVenta": "5000",
        "Canal": "01",
        "Direccion": "AVDA CONQUISTADORES 1565",
        "Sector": "S1",
        "CodigoGenerico": "000000000100000021",
        "NombreGenerico": "ACIDO FOLICO 1 MG CM/CM REC",
        "ValidoDesde": "20240801",
        "ValidoHasta": "20240831",
        "CantidadUnitariaProgramada": 2000.000,
        "ValorizadoProgramado": 16000.00,
        "MotivoRechazo": " ",
        "Comuna": "MAIPU",
        "Region": "METROPOLITANA DE SANTIAGO"
    },
    {
        "Oferta": "0115350564",
        "Posicion": "000010",
        "RutSolicitante": "0069070900",
        "NombreSolicitante": "MUNICIPALIDAD MAIPU",
        "RutDestinatario": "0000200024",
        "NombreDestinatario": "CESFAM CARLOS GODOY",
        "OrganizacionVenta": "5000",
        "Canal": "01",
        "Direccion": "AVDA CONQUISTADORES 1565",
        "Sector": "S1",
        "CodigoGenerico": "000000000100000046",
        "NombreGenerico": "AGUA ESTERIL P/INYECTABLES 10 ML AM",
        "ValidoDesde": "20240801",
        "ValidoHasta": "20240831",
        "CantidadUnitariaProgramada": 100.000,
        "ValorizadoProgramado": 4900.00,
        "MotivoRechazo": " ",
        "Comuna": "MAIPU",
        "Region": "METROPOLITANA DE SANTIAGO"
    },
    {
        "Oferta": "0115350559",
        "Posicion": "000010",
        "RutSolicitante": "0069070900",
        "NombreSolicitante": "MUNICIPALIDAD MAIPU",
        "RutDestinatario": "0000200024",
        "NombreDestinatario": "CESFAM CARLOS GODOY",
        "OrganizacionVenta": "5000",
        "Canal": "01",
        "Direccion": "AVDA CONQUISTADORES 1565",
        "Sector": "S1",
        "CodigoGenerico": "000000000100000086",
        "NombreGenerico": "ALCOHOL ETILICO 70° DESINFEC 1000 ML FRA",
        "ValidoDesde": "20240801",
        "ValidoHasta": "20240831",
        "CantidadUnitariaProgramada": 36.000,
        "ValorizadoProgramado": 43272.00,
        "MotivoRechazo": "14",
        "Comuna": "MAIPU",
        "Region": "METROPOLITANA DE SANTIAGO"
    },
    {
        "Oferta": "0115612243",
        "Posicion": "000010",
        "RutSolicitante": "0069070900",
        "NombreSolicitante": "MUNICIPALIDAD MAIPU",
        "RutDestinatario": "0000200024",
        "NombreDestinatario": "CESFAM CARLOS GODOY",
        "OrganizacionVenta": "5000",
        "Canal": "01",
        "Direccion": "AVDA CONQUISTADORES 1565",
        "Sector": "S1",
        "CodigoGenerico": "000000000100000087",
        "NombreGenerico": "ALCOHOL ETILICO 70° ANTISEPT 250 ML FRA",
        "ValidoDesde": "20240801",
        "ValidoHasta": "20240831",
        "CantidadUnitariaProgramada": 36.000,
        "ValorizadoProgramado": 19476.00,
        "MotivoRechazo": "14",
        "Comuna": "MAIPU",
        "Region": "METROPOLITANA DE SANTIAGO"
    },
    {
        "Oferta": "0115350563",
        "Posicion": "000010",
        "RutSolicitante": "0069070900",
        "NombreSolicitante": "MUNICIPALIDAD MAIPU",
        "RutDestinatario": "0000200024",
        "NombreDestinatario": "CESFAM CARLOS GODOY",
        "OrganizacionVenta": "5000",
        "Canal": "01",
        "Direccion": "AVDA CONQUISTADORES 1565",
        "Sector": "S1",
        "CodigoGenerico": "000000000100000087",
        "NombreGenerico": "ALCOHOL ETILICO 70° ANTISEPT 250 ML FRA",
        "ValidoDesde": "20240801",
        "ValidoHasta": "20240831",
        "CantidadUnitariaProgramada": 36.000,
        "ValorizadoProgramado": 18828.00,
        "MotivoRechazo": "14",
        "Comuna": "MAIPU",
        "Region": "METROPOLITANA DE SANTIAGO"
    },
    {
        "Oferta": "0115350561",
        "Posicion": "000010",
        "RutSolicitante": "0069070900",
        "NombreSolicitante": "MUNICIPALIDAD MAIPU",
        "RutDestinatario": "0000200024",
        "NombreDestinatario": "CESFAM CARLOS GODOY",
        "OrganizacionVenta": "5000",
        "Canal": "01",
        "Direccion": "AVDA CONQUISTADORES 1565",
        "Sector": "S2",
        "CodigoGenerico": "000000000100000219",
        "NombreGenerico": "BOLSA RECOLE ORINA ADULTO ESTERI GRAD 2L",
        "ValidoDesde": "20240801",
        "ValidoHasta": "20240831",
        "CantidadUnitariaProgramada": 20.000,
        "ValorizadoProgramado": 20580.00,
        "MotivoRechazo": " ",
        "Comuna": "MAIPU",
        "Region": "METROPOLITANA DE SANTIAGO"
    },
    {
        "Oferta": "0115350567",
        "Posicion": "000010",
        "RutSolicitante": "0069070900",
        "NombreSolicitante": "MUNICIPALIDAD MAIPU",
        "RutDestinatario": "0000200024",
        "NombreDestinatario": "CESFAM CARLOS GODOY",
        "OrganizacionVenta": "5000",
        "Canal": "01",
        "Direccion": "AVDA CONQUISTADORES 1565",
        "Sector": "S1",
        "CodigoGenerico": "000000000100000714",
        "NombreGenerico": "GENTAMICINA 0,3 %  SOL. OFT. FRA 5 ML",
        "ValidoDesde": "20240801",
        "ValidoHasta": "20240831",
        "CantidadUnitariaProgramada": 10.000,
        "ValorizadoProgramado": 6090.00,
        "MotivoRechazo": " ",
        "Comuna": "MAIPU",
        "Region": "METROPOLITANA DE SANTIAGO"
    },
    {
        "Oferta": "0115350570",
        "Posicion": "000010",
        "RutSolicitante": "0069070900",
        "NombreSolicitante": "MUNICIPALIDAD MAIPU",
        "RutDestinatario": "0000200024",
        "NombreDestinatario": "CESFAM CARLOS GODOY",
        "OrganizacionVenta": "5000",
        "Canal": "01",
        "Direccion": "AVDA CONQUISTADORES 1565",
        "Sector": "S1",
        "CodigoGenerico": "000000000100001106",
        "NombreGenerico": "ONDANSETRON  2MG/ML SOL. INY.AM O FAM2ML",
        "ValidoDesde": "20240801",
        "ValidoHasta": "20240831",
        "CantidadUnitariaProgramada": 100.000,
        "ValorizadoProgramado": 19400.00,
        "MotivoRechazo": " ",
        "Comuna": "MAIPU",
        "Region": "METROPOLITANA DE SANTIAGO"
    },
    ...

```
