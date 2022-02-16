defmodule GodaddyDnsManager do
  @moduledoc false
  use Tesla

  plug(Tesla.Middleware.BaseUrl, config(:api_url))
  plug(Tesla.Middleware.JSON)

  plug(Tesla.Middleware.Headers, [
    {"authorization", "sso-key #{config(:api_key)}:#{config(:api_secret)}"}
  ])

  @record_name "_acme-challenge"
  @record_type "TXT"

  def create_record(value),
    do: patch("domains/#{config(:domain)}/records", body(value))

  def cleanup_record,
    do: put("domains/#{config(:domain)}/records/#{@record_type}/#{@record_name}", body("..."))

  defp config(key), do: Application.get_env(:godaddy_dns_manager, __MODULE__)[key]

  defp body(data) do
    [
      %{
        "data" => data,
        "name" => @record_name,
        "type" => @record_type,
        "ttl" => 600
      }
    ]
  end
end
