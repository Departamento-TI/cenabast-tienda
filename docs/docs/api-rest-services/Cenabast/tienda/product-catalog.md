# Product Catalog

## Request

```jsx
POST '{{HOST}}/interoperabilidad/tienda/api/v1/materiales/listacatalogo' \
--header 'Authorization: Bearer tokenvalue' \
--data '{
  "codigoProducto": null,
  "tipoProducto": "ZCEN",
  "grupoArticulo": null,
  "codigoSector": "S1",
  "PageNumber": 1,
  "PageSize": 10
}'
```

## Response

```jsx
{
    "code": 200,
    "isSuccessStatusCode": true,
    "content": [
        {
            "codigoProducto": "100000000",
            "tipoProducto": "ZGEN",
            "grupoArticulo": "3TB",
            "codigoSector": "S1",
            "descripcionSector": "Fármacos",
            "denominacion": "RIFAMPICINA/ISONIAZIDA 150/150 MG CM/CP",
            "codigoATC": "IQVIATECH--K",
            "denominacionEstandar": "2-CDF-RH",
            "codigoONU": "51102002",
            "tablaBase": "2.2",
            "jerarquia": "0010000200007",
            "ump": "",
            "fabricante": "",
            "codigoEAN": "",
            "descripcionGrupoArticulo": "TBC"
        },
        {
            "codigoProducto": "100000000",
            "tipoProducto": "ZGEN",
            "grupoArticulo": "3TB",
            "codigoSector": "S1",
            "descripcionSector": "Product Division 01",
            "denominacion": "RIFAMPICINA/ISONIAZIDA 150/150 MG CM/CP",
            "codigoATC": "IQVIATECH--K",
            "denominacionEstandar": "2-CDF-RH",
            "codigoONU": "51102002",
            "tablaBase": "2.2",
            "jerarquia": "0010000200007",
            "ump": "",
            "fabricante": "",
            "codigoEAN": "",
            "descripcionGrupoArticulo": "TBC"
        },
        {
            "codigoProducto": "100000000",
            "tipoProducto": "ZGEN",
            "grupoArticulo": "3TB",
            "codigoSector": "S1",
            "descripcionSector": "Produktsparte 01",
            "denominacion": "RIFAMPICINA/ISONIAZIDA 150/150 MG CM/CP",
            "codigoATC": "IQVIATECH--K",
            "denominacionEstandar": "2-CDF-RH",
            "codigoONU": "51102002",
            "tablaBase": "2.2",
            "jerarquia": "0010000200007",
            "ump": "",
            "fabricante": "",
            "codigoEAN": "",
            "descripcionGrupoArticulo": "TBC"
        },
        ....
```