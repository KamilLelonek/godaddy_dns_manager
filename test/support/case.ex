defmodule CertManager.TestCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      import Tesla.Mock
    end
  end
end
