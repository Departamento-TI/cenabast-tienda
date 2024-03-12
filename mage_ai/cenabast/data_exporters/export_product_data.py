from cenabast.utils.spree_api_client.base_client import BaseClient
from cenabast.utils.spree_api_client.stores_client import StoresClient
from cenabast.utils.spree_api_client.taxons_client import TaxonsClient
from cenabast.utils.spree_api_client.properties_client import PropertiesClient
from cenabast.utils.spree_api_client.generic_products_client import GenericProductsClient
from cenabast.utils.spree_api_client.products_client import ProductsClient
from cenabast.utils.spree_api_client.contracts_client import ContractsClient
from cenabast.utils.spree_api_client.variants_client import VariantsClient

if 'data_exporter' not in globals():
    from mage_ai.data_preparation.decorators import data_exporter


@data_exporter
def export_data(data, *args, **kwargs):
    # Get logger
    logger = kwargs.get('logger')
    logger.debug("Testing API methods")

    # Get autentication token
    client = BaseClient(None, logger)
    token = client.get_token()
    logger.debug("token obtained:", token)

    # Get general information about stores
    stores_client = StoresClient(token, logger)
    stores = stores_client.get_stores_data()
    logger.debug("Stores:", stores)

    # Get main taxon categories to use
    taxons_client = TaxonsClient(token, logger)
    taxons = taxons_client.get_parent_taxons_data()
    logger.debug("Taxons:", taxons)

    # Get information about (Product) properties to use
    properties_client = PropertiesClient(token, logger)
    properties = properties_client.get_properties_data()
    logger.debug("Properties:", properties)

    # Process each product
    generic_products_client = GenericProductsClient(token, logger)
    for product in data:
        process_generic_product(product, generic_products_client)


def process_generic_product(product, generic_products_client):
    # Get code (SKU)
    codigoProducto = product['codigoProducto']

    # Get generic product data from Spree API
    existing_generic_product = None
    api_response = generic_products_client.get_generic_product_data(codigoProducto)
    api_results = api_response.get('results', [])
    if isinstance(api_results, list) and len(api_results) > 0:
        existing_generic_product = api_results[0]

    # Prepare payload with product information
    payload = build_generic_product_payload(product)

    if existing_generic_product:
        # Compare payload with existing data and update if necessary
        # Only compare shared keys (dont consider id, created_at... etc)
        filtered_attributes = {key: value for key, value in existing_generic_product.items() if key in payload.keys()}
        if payload != filtered_attributes:
            print(f"Generic product {codigoProducto} needs update, updating.")
            generic_products_client.update_generic_product(existing_generic_product['id'], payload)
        else:
            print(f"No changes for generic product {codigoProducto}, no update needed")
    else:
        # Create product
        print(f"Generic product {codigoProducto} didnt exist, creating.")
        generic_products_client.create_generic_product(payload)
        print(f"Created new generic product {codigoProducto}")
        
    

def build_generic_product_payload(product):
    return {
        "product_type": 'generic',
        "code": product['codigoProducto'],
        "code_atc": product['codigoATC'],
        "code_onu": product['codigoONU'],
        "code_ean": product['codigoEAN'],
        "denomination": product['denominacion'],
        "standard_denomination": product['denominacionEstandar'],
        "hierarchy": product['jerarquia'],
        "ump": product['ump'],
        "manufacturer": product['fabricante'],
        "base_table": product['tablaBase'],
    }

def dead_code():
    generic_products_client = GenericProductsClient(token, logger)
    generic_product = generic_products_client.get_generic_product_data('yisgzyrgAAAA')
    logger.debug("Product (ZGEN):", generic_product)

    generic_product_payload = {
        "code": "NewCode12342",
        "code_atc": "edited attribute",
        "code_onu": "editedjxabos",
        "code_ean": "29551453",
        "denomination": "ut",
        "standard_denomination": "voluptatem",
        "product_type": "generic",
        "hierarchy": "qui",
        "ump": "dolor",
        "manufacturer": "dolorum",
        "base_table": "fuga"
    }
    result = generic_products_client.create_generic_product(generic_product_payload)
    logger.debug("create_generic_product result:", result)

    contracts_client = ContractsClient(token, logger)
    contract = contracts_client.get_contract_data('new-contract-code')
    logger.debug("Contract (ZCEN):", contract)

    contract_payload = {
        "sale_order": "sale-order-mageai",
        "code": "new-contract-code-testing-api",
        "name": "Contract",
        "mercado_publico_oc": "yhdqxnwd",
        "center": 2,
        "price_before_iva": "21.0",
        "price_iva": "10.0",
        "price": "139.0",
        "comission": "5.0",
        "available_on": None,
        "discontinue_on": None,
        "unit_sale": "dolore",
        "unit": "dolore"
    }
    result = contracts_client.create_contract(contract_payload)
    logger.debug("create_contract result:", result)

    products_client = ProductsClient(token, logger)
    product = products_client.get_product_data('new-contract-code-2')
    logger.debug("Product (Spree::Product):", product)

    variants_client = VariantsClient(token, logger)
    variant = variants_client.get_variant_data('new-contract-code-2')
    logger.debug("Variant (Spree::Variant):", variant)
    """
    Exports data to some source.

    Args:
        data: The output from the upstream parent block
        args: The output from any additional upstream blocks (if applicable)

    Output (optional):
        Optionally return any object and it'll be logged and
        displayed when inspecting the block run.
    """
    # Specify your data exporting logic here



