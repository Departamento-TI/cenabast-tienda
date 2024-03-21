require 'money'

# https://github.com/RubyMoney/money/issues/930#issuecomment-626241196
# Set the locale backend to use currency data, not i18n information
Money.locale_backend = :currency

# Define a custom format for the currency
# respecting commas for thousand separators and dots for decimal places
Money::Currency.unregister('CLP')
Money::Currency.register({
  priority: 1,
  iso_code: "CLP",
  name: "Chilean Peso",
  symbol: "$",
  symbol_first: true,
  subunit: "Peso",
  subunit_to_unit: 1,
  thousands_separator: ',',
  decimal_mark: '.'
})
