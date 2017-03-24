defmodule Game.ScenarioCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      use ExUnit.Case
      import Game.Test.ScenarioHelpers
    end
  end
end
