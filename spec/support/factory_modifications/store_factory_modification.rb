FactoryBot.modify do
  factory :store do
    default_currency       { 'CLP' }
    supported_currencies   { 'CLP' }
    default_locale         { 'es' }
  end
end
