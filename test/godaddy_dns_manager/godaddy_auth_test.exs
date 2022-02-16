defmodule GodaddyDnsManager.GoDaddyAuthTest do
  use GodaddyDnsManager.TestCase, async: true

  alias GodaddyDnsManager.GoDaddyAuth

  setup do
    {:ok, domain: Application.get_env(:godaddy_dns_manager, GoDaddyAuth)[:domain]}
  end

  describe "create_record/1" do
    setup %{domain: domain} do
      {:ok, url: "https://api.godaddy.com/v1/domains/#{domain}/records"}
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

  describe "cleanup_record/0" do
    setup %{domain: domain} do
      {:ok, url: "https://api.godaddy.com/v1/domains/#{domain}/records/TXT/_acme-challenge"}
    end

    test "should clear the existing TXT record", %{url: url} do
      body = ""

      mock(fn %{method: :put, url: ^url} ->
        %Tesla.Env{status: 200, body: body}
      end)

      assert {:ok, %Tesla.Env{body: ^body}} = GoDaddyAuth.cleanup_record()
    end
  end
end
