defmodule GodaddyDnsManager.MixProject do
  use Mix.Project

  def project do
    [
      app: :godaddy_dns_manager,
      version: "0.1.0",
      elixir: "~> 1.13",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {GodaddyDnsManager.Application, []}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:tesla, "~> 1.4"},
      {:hackney, "~> 1.18"},
      {:jason, "~> 1.2"},
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false}
    ]
  end
end
