from datetime import datetime, timedelta
import calendar

if 'transformer' not in globals():
    from mage_ai.data_preparation.decorators import transformer
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test

@transformer
def transform(data, *args, **kwargs):
    # Transform into an array if needed
    if isinstance(data, dict):
        data = [data]

    # Get logger
    logger = kwargs.get('logger')

    # Rewrite contracts to only have valid ones
    # Valid ones are ones that have a current date
    # Current, meaning the start date has already passed (contract already running), and
    # the end date hasnt yet elapsed (contract hasnt expired)
    logger.info(data)
    current_date = datetime.now()
    for product in data:
        if product.get('contracts', None) == None:
            product['contracts'] = []
        if 'contracts' in product:
            valid_contracts = filter_valid_contracts(product['contracts'], current_date, logger)
            product['contracts'] = valid_contracts

    # Filter products with valid contract_info
    valid_products = [
        product for product in data
        if len(product['contracts']) > 0
    ]

    for product in valid_products:
        # Set ZGEN of a product
        product['zgen'] = product['contracts'][0]['zgen']

    logger.info(f'Amount of total products (before filter): {len(data)}')
    logger.info(f'Amount of valid products (after filter): {len(valid_products)}')

    return valid_products

def filter_valid_contracts(contracts, current_date, logger):
    """
    Filter out invalid contracts based on start and end dates.

    Args:
        contracts: Array containing information about contracts
        current_date: The current date
        logger: logger object

    Returns:
        List of valid contracts
    """
    valid_contracts = [
        contract for contract in contracts
        if is_valid_contract(contract, current_date, logger)
    ]
    return valid_contracts

def is_valid_contract(contract, current_date, logger):
    """
    Check if the contract is valid based on start and end dates.

    Args:
        contract: Information about the contract
        current_date: The current date
        logger: logger object

    Returns:
        True if the contract is valid, False otherwise
    """
    start_date = datetime.strptime(contract.get('fechaInicialContrato'), '%Y%m')
    end_date = datetime.strptime(contract.get('fechaFinalContrato'), '%Y%m')
    end_date = end_date + timedelta(days=calendar.monthrange(end_date.year, end_date.month)[1]-1, hours=23, minutes=59, seconds=59)

    logger.debug(f'start_date is: {start_date}')
    logger.debug(f'current_date is: {current_date}')
    logger.debug(f'end_date is: {end_date}')
    
    logger.debug(f'condition check is: {start_date <= current_date < end_date}')

    return start_date <= current_date < end_date