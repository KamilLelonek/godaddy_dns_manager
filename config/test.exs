import Config

config :tesla, adapter: Tesla.Mock

config :cert_manager, CertManager.GoDaddyAuth,
  api_key: "godddy_test_api_key",
  api_secret: "godddy_test_api_secret"
