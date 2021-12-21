defmodule CertManager.GoDaddyAuthTest do
  use CertManager.TestCase, async: true

  alias CertManager.GoDaddyAuth

  describe "create_record/1" do
    setup do
      domain = Application.get_env(:cert_manager, GoDaddyAuth)[:domain]
      url = "https://api.godaddy.com/v1/domains/#{domain}/records"

      {:ok, url: url}
    end

    test "shoudl send PATCH request to GoDaddy with a specified data", %{url: url} do
      body = ""

      mock(fn %{method: :patch, url: ^url} ->
        %Tesla.Env{status: 200, body: body}
      end)

      assert {:ok, %Tesla.Env{body: ^body}} = GoDaddyAuth.create_record("RECORD")
    end

    test "should not send a PATCH request with invalid credentials", %{url: url} do
      body = %{
        "code" => "UNABLE_TO_AUTHENTICATE",
        "message" => "Unauthorized : Could not authenticate API key/secret"
      }

      mock(fn %{method: :patch, url: ^url} ->
        {401, [], body}
      end)

      assert {:ok, %Tesla.Env{status: 401, body: ^body}} = GoDaddyAuth.create_record("RECORD")
    end
  end
end
