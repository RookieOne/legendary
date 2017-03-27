defmodule Game.Player.DiscardCardTest do
  use ExUnit.Case

  alias Game.{Cards, Player}

  test "if there the card is in the hand, it should move card from hand to discard" do
    card = Cards.Shield.create(:shield_agent)
    player = %Player{
      hand: [card],
      deck: []
    }

    player = Player.discard_card(player, card.id)

    assert Enum.count(player.hand) == 0
    assert Enum.count(player.deck) == 0
    assert Enum.count(player.discard) == 1
  end

  test "if there the card is in the hand and cards in discard, it should move card from hand to discard" do
    card = Cards.Shield.create(:shield_agent)
    player = %Player{
      hand: [card],
      deck: [],
      discard: [Cards.Shield.create(:shield_agent)]
    }

    player = Player.discard_card(player, card.id)

    assert Enum.count(player.hand) == 0
    assert Enum.count(player.deck) == 0
    assert Enum.count(player.discard) == 2
  end

  test "if there the card is not in the hand, it should return an error" do
    card = Cards.Shield.create(:shield_agent)
    player = %Player{
      hand: [],
      deck: [],
      discard: []
    }

    result = Player.discard_card(player, card.id)

    assert result == {:error, "Card not found in hand to discard"}
  end
end
