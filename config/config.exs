import Config

config :tesla, adapter: Tesla.Adapter.Hackney

config :godaddy_dns_manager, GodaddyDnsManager,
  api_url: "https://api.godaddy.com/v1/",
  domain: "example.com"

import_config "#{config_env()}.exs"
