import traceback

from cenabast.utils.data_exporter.general_functions import get_token, build_api_clients, build_general_data

from cenabast.utils.data_exporter.generic_product_functions import create_or_update_generic_product
from cenabast.utils.data_exporter.taxon_functions import create_or_update_taxon
from cenabast.utils.data_exporter.vendor_functions import create_or_update_vendor
from cenabast.utils.data_exporter.product_functions import create_or_update_product
from cenabast.utils.data_exporter.contract_functions import create_or_update_spree_contract
from cenabast.utils.data_exporter.variant_functions import update_variant
from cenabast.utils.data_exporter.stock_item_functions import create_or_update_stock_item

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
    
    # Return stats
    return {
        'success_count': general_data['success_count'],
        'error_count': general_data['error_count'],
        'error_products': general_data['error_products'],
    }


def process_api_product(product, api_clients, general_data):
    code_product = product['codigoProducto']
    try:
        general_data['logger'].info(f"Processing product {code_product}")
        # Sync Generic Product (ZGEN) data
        generic_product = create_or_update_generic_product(product, api_clients, general_data)

        products = []
        spree_contracts = []
        variants = []

        # Sync Taxon data
        taxon = None # create_or_update_taxon(product, api_clients, general_data)
        for contract in product['contracts']:
            # Sync Vendor data
            vendor = create_or_update_vendor(contract, api_clients, general_data)

            # Sync Product data
            product_data = {
                'generic_product': generic_product,
                'taxon': taxon,
                'vendor': vendor
            }
            product = create_or_update_product(contract, api_clients, general_data, product_data)
            products.append(product)

            # Sync Contract (ZCEN) data
            spree_contract_data = {
                'product': product
            }
            spree_contract = create_or_update_spree_contract(contract, api_clients, general_data, spree_contract_data)
            spree_contracts.append(spree_contract)

            # Sync Variant data
            variant_data = {
                'product': product
            }
            variant = update_variant(contract, api_clients, general_data, variant_data)
            variants.append(variant)

            # Sync Stock item
            stock_item_data = {
                'variant': variant
            }
            create_or_update_stock_item(contract, api_clients, general_data, stock_item_data)

        # Filter None information
        products = list(filter(lambda x: x is not None, products))
        spree_contracts = list(filter(lambda x: x is not None, spree_contracts))
        variants = list(filter(lambda x: x is not None, variants))

        if len(products) > 0 and len(spree_contracts) > 0 and len(variants) > 0:
            # Increment success count
            general_data['success_count'] += 1
        else:
            # For some reason, product, contract, variant creation was not as expected.
            # Log it as an error
            general_data['logger'].error(f"Data synchronization for product {code_product} wasnt complete")
            # Increment error count
            general_data['error_count'] += 1
            # Add product to error list
            general_data['error_products'].append(code_product)
    except Exception as e:
        # Log the exception
        general_data['logger'].error(f"Error processing product {code_product}: {str(e)}")
        general_data['logger'].error(traceback.format_exc())

        # Increment error count
        general_data['error_count'] += 1

        # Add product to error list
        general_data['error_products'].append(code_product)



