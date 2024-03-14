Rails.application.config.after_initialize do
  # Disable browser cache to always send http request to the server
  # https://github.com/Departamento-TI/cenabast-tienda/issues/47#issuecomment-1995579584
  Spree::Frontend::Config[:http_cache_enabled] = false
end
