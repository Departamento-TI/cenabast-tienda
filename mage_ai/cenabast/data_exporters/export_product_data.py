from cenabast.utils.spree_api_client.base_client import BaseClient
from cenabast.utils.spree_api_client.stores_client import StoresClient
from cenabast.utils.spree_api_client.taxons_client import TaxonsClient
from cenabast.utils.spree_api_client.properties_client import PropertiesClient
from cenabast.utils.spree_api_client.generic_products_client import GenericProductsClient
from cenabast.utils.spree_api_client.products_client import ProductsClient
from cenabast.utils.spree_api_client.contracts_client import ContractsClient
from cenabast.utils.spree_api_client.variants_client import VariantsClient
from cenabast.utils.spree_api_client.vendors_client import VendorsClient

from cenabast.utils.data_exporter.generic_product_functions import create_or_update_generic_product
from cenabast.utils.data_exporter.taxon_functions import create_or_update_taxon
from cenabast.utils.data_exporter.vendor_functions import create_or_update_vendor
from cenabast.utils.data_exporter.product_functions import create_or_update_product

if 'data_exporter' not in globals():
    from mage_ai.data_preparation.decorators import data_exporter


@data_exporter
def export_data(data, *args, **kwargs):
    # Get logger
    logger = kwargs.get('logger')

    # Get Spree token
    token = get_token(logger)

    # Build api_clients
    api_clients = build_api_clients(token, logger)

    # Build general information to use (spree, logger, etc)
    general_data = build_general_data(logger, api_clients)

    # Process each product
    for product in data:
        process_api_product(product, api_clients, general_data)
    
def get_token(logger):
    # Get autentication token
    client = BaseClient(None, logger)
    token = client.get_token()
    logger.debug("token obtained:", token)
    return token

def build_api_clients(token, logger):
    return {
        'generic_products_client': GenericProductsClient(token, logger),
        'stores_client': StoresClient(token, logger),
        'taxons_client': TaxonsClient(token, logger),
        'properties_client': PropertiesClient(token, logger),
        'vendors_client': VendorsClient(token, logger),
        'products_client': ProductsClient(token, logger)
    }

def build_general_data(logger, api_clients):
    # Get general information about stores
    stores_client = api_clients['stores_client']
    stores = stores_client.get_stores_data()
    logger.debug("Stores:", stores)

    # Get main taxon categories to use
    taxons_client = api_clients['taxons_client']
    parent_taxons = taxons_client.get_parent_taxons_data()
    logger.debug("Parent Taxons:", parent_taxons)

    # Get information about (Product) properties to use
    properties_client = api_clients['properties_client']
    properties = properties_client.get_properties_data()
    logger.debug("Properties:", properties)

    # Build needed information dicts
    return {
        'stores': stores,
        'parent_taxons': parent_taxons,
        'properties': properties,
        'logger': logger
    }

def process_api_product(product, api_clients, general_data):
    generic_product = create_or_update_generic_product(product, api_clients, general_data)
    taxon = create_or_update_taxon(product, api_clients, general_data)
    for contract in product['contracts']:
        vendor = create_or_update_vendor(contract, api_clients, general_data)
        product_data = {
            'generic_product': generic_product,
            'taxon': taxon,
            'vendor': vendor
        }
        product = create_or_update_product(contract, api_clients, general_data, product_data)


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



