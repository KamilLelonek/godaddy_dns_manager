import Config

config :tesla, adapter: Tesla.Adapter.Hackney

config :cert_manager, CertManager.GoDaddyAuth,
  api_url: "https://api.godaddy.com/v1/",
  domain: "tyllpos.com"

import_config "#{config_env()}.exs"
