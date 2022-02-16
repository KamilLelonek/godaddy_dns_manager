defmodule GodaddyDnsManager.TestCase do
  @moduledoc false
  use ExUnit.CaseTemplate

  using do
    quote do
      import Tesla.Mock
    end
  end
end
