defmodule StartGameTest do
  use ExUnit.Case

  alias Game.StartGame

  test "start single player game" do
    game = StartGame.start_game(%StartGame{number_of_players: 1})

    assert Enum.count(game.players) == 1
    assert game.board != nil

    player = hd(game.players)

    assert Enum.count(player.deck) == 12
  end
end
