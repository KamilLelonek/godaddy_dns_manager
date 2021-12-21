defmodule CertManager.GoDaddyAuth do
  use Tesla

  plug(Tesla.Middleware.BaseUrl, config(:api_url))
  plug(Tesla.Middleware.JSON)

  plug(Tesla.Middleware.Headers, [
    {"authorization", "sso-key #{config(:api_key)}:#{config(:api_secret)}"}
  ])

  def create_record(value),
    do: patch("domains/#{config(:domain)}/records", body(value))

  defp config(key), do: Application.get_env(:cert_manager, __MODULE__)[key]

  defp body(data) do
    [
      %{
        "data" => data,
        "name" => "_acme-challenge",
        "type" => "TXT",
        "ttl" => 600
      }
    ]
  end
end
