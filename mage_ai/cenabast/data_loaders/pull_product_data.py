from cenabast.utils.data_importer.cenabast_api_functions import get_products

if 'data_loader' not in globals():
    from mage_ai.data_preparation.decorators import data_loader
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test

@data_loader
def load_data_from_api(*args, **kwargs):
    return get_products(*args, **kwargs)
