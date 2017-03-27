defmodule Game.Test.Cards.WoundTest do
  use ExUnit.Case

  alias Game.Cards

  test "creating a wound card" do
    card = Cards.Wound.create()

    assert card.name == "Wound"
    assert card.hero_name == "Wound"
  end
end
