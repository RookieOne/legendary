defmodule Game.Player.DrawCardTest do
  use ExUnit.Case

  alias Game.{Cards, Player}

  test "if there is a card in the deck, it should add card from deck to hand" do
    player = %Player{
      hand: [],
      deck: [Cards.Shield.create(:shield_agent)]
    }

    player = Player.draw_card(player)

    assert Enum.count(player.hand) == 1
    assert Enum.count(player.deck) == 0
  end

  test "if there is no cards in the deck but cards in the discard pile, it should shuffle discard pile into deck and
        add a card from new deck to hand" do
    player = %Player{
      discard: [Cards.Shield.create(:shield_agent)],
      hand: [],
      deck: []
    }

    player = Player.draw_card(player)

    assert Enum.count(player.hand) == 1
    assert Enum.count(player.deck) == 0
    assert Enum.count(player.discard) == 0
  end

  test "if there is no cards in the deck and no discards, it should do nothing" do
    player = %Player{
      hand: [Cards.Shield.create(:shield_agent)],
      deck: []
    }

    player = Player.draw_card(player)

    assert Enum.count(player.hand) == 1
    assert Enum.count(player.deck) == 0
  end
end
