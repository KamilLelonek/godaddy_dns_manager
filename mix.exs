defmodule CertManager.MixProject do
  use Mix.Project

  def project do
    [
      app: :cert_manager,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {CertManager.Application, []}
    ]
  end

  defp deps do
    [
      {:tesla, "~> 1.4"},
      {:hackney, "~> 1.18"},
      {:jason, "~> 1.2"}
    ]
  end
end
