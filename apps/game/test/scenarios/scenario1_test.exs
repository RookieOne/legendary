defmodule Game.Scenarios.Scenario1Test do
  @moduledoc """
  Test the complete playing of a SHIELD hand from player 1
  """

  use Game.ScenarioCase

  alias Game.{Board, Cards, Player}

  setup do
    player1 = %Player{
      name: "1",
      hand: [
        Cards.Shield.create(:shield_agent),
        Cards.Shield.create(:shield_agent),
        Cards.Shield.create(:shield_trooper),
        Cards.Shield.create(:shield_agent),
        Cards.Shield.create(:shield_trooper)
      ],
      deck: []
    }
    player2 = %Player{
      name: "2",
      hand: [Cards.Shield.create(:shield_agent)],
      deck: []
    }

    game = %Game{
      board: %Board{},
      players: [player1, player2]
    }
    {:ok, game: game}
  end

  test "should play first card", %{game: game} do
    player1 = find_player(game, "1")

    card = find_card_in_hand(game, player: "1", card: "S.H.I.E.L.D. Agent")
    game = Game.execute(game, {player1.id, :play_card, card.id})

    player1 = Game.find_player(game, player1.id)
    assert player1.recruit_points == 1
    assert Enum.count(player1.played_cards) == 1
    assert Enum.count(player1.hand) == 4
  end

  test "should play second card", %{game: game} do
    player1 = find_player(game, "1")

    card = find_card_in_hand(game, player: "1", card: "S.H.I.E.L.D. Agent")
    game = Game.execute(game, {player1.id, :play_card, card.id})

    card = find_card_in_hand(game, player: "1", card: "S.H.I.E.L.D. Trooper")
    game = Game.execute(game, {player1.id, :play_card, card.id})

    player1 = Game.find_player(game, player1.id)
    assert player1.attack == 1
    assert player1.recruit_points == 1
    assert Enum.count(player1.played_cards) == 2
    assert Enum.count(player1.hand) == 3
  end
end
