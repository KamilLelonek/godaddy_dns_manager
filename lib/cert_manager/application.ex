defmodule CertManager.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args), do: Supervisor.start_link(children(), opts())

  defp children do
    []
  end

  defp opts do
    [
      strategy: :one_for_one,
      name: CertManager.Supervisor
    ]
  end
end
