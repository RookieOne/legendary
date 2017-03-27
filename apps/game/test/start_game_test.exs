defmodule StartGameTest do
  use ExUnit.Case

  alias Game.StartGame

  test "start single player game" do
    game = StartGame.start_game(%StartGame{number_of_players: 1})

    assert Enum.count(game.players) == 1

    player = hd(game.players)

    assert Enum.count(player.hand) == 6
    assert Enum.count(player.deck) == 6

    assert game.board != nil
    assert Enum.count(game.board.shield_officers) == 30
    assert Enum.count(game.board.wounds) == 30
  end
end
