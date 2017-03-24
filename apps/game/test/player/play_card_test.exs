defmodule Game.Player.PlayCardTest do
  use ExUnit.Case

  alias Game.Player

  test "if the player has the card, it should be able to be played" do
    card = Cards.Shield.create(:shield_agent)
    player = %Player{
      hand: [card],
      deck: []
    }

    player = Player.play_card(player, card.id)

    assert Enum.count(player.hand) == 0
    assert Enum.count(player.played_cards) == 1
    assert Enum.count(player.deck) == 0
    assert Enum.count(player.discard) == 0
    assert player.recruit_points == 1
  end

  test "if the player has the card, it should be able to be played from hand" do
    card = Cards.Shield.create(:shield_agent)
    player = %Player{
      hand: [
        card,
        Cards.Shield.create(:shield_agent),
        Cards.Shield.create(:shield_agent),
        Cards.Shield.create(:shield_agent)
      ],
      deck: []
    }

    player = Player.play_card(player, card.id)

    assert Enum.count(player.hand) == 3
    assert Enum.count(player.played_cards) == 1
    assert Enum.count(player.deck) == 0
    assert Enum.count(player.discard) == 0
    assert player.recruit_points == 1
  end
end
