defmodule Game.Player.DrawHandTest do
  use ExUnit.Case

  alias Game.HeroCard
  alias Game.Player

  test "if there are 6 cards in the deck, it should draw all 6 cards from deck" do
    player = %Player{
      deck: [
        HeroCard.create(:shield_agent),
        HeroCard.create(:shield_agent),
        HeroCard.create(:shield_agent),
        HeroCard.create(:shield_agent),
        HeroCard.create(:shield_agent),
        HeroCard.create(:shield_agent),
      ],
      hand: [],
    }

    player = Player.draw_hand(player)

    assert Enum.count(player.deck) == 0
    assert Enum.count(player.discard) == 0
    assert Enum.count(player.hand) == 6
  end

  test "if there are not enough cards in the deck, it should draw cards from deck and shuffle in cards from discard" do
    player = %Player{
      discard: [
        HeroCard.create(:shield_agent),
        HeroCard.create(:shield_agent),
      ],
      deck: [
        HeroCard.create(:shield_agent),
        HeroCard.create(:shield_agent),
        HeroCard.create(:shield_agent),
        HeroCard.create(:shield_agent),
      ],
      hand: [],
    }

    player = Player.draw_hand(player)

    assert Enum.count(player.deck) == 0
    assert Enum.count(player.discard) == 0
    assert Enum.count(player.hand) == 6
  end

  test "if there are not enough cards in the deck and discard, it should draw cards only available cards" do
    player = %Player{
      discard: [
        HeroCard.create(:shield_agent),
        HeroCard.create(:shield_agent),
      ],
      deck: [
        HeroCard.create(:shield_agent),
      ],
      hand: [],
    }

    player = Player.draw_hand(player)

    assert Enum.count(player.deck) == 0
    assert Enum.count(player.discard) == 0
    assert Enum.count(player.hand) == 3
  end
end
