from cenabast.utils.spree_api_client import SpreeApiClient

if 'data_exporter' not in globals():
    from mage_ai.data_preparation.decorators import data_exporter


@data_exporter
def export_data(data, *args, **kwargs):
    print("Testing:")
    client = SpreeApiClient()
    stores = client.get_stores_data()
    print("Stores:", stores)

    taxons = client.get_parent_taxons_data()
    print("Taxons:", taxons)

    properties = client.get_properties_data()
    print("Properties:", properties)

    sample_product = client.get_generic_product_data('yisgzyrgAAAA')
    print("Product:", sample_product)

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
    result = client.create_generic_product(generic_product_payload)
    print("create_generic_product result:", result)
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



