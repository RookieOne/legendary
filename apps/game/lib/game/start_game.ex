defmodule Game.StartGame do
  defstruct [
    number_of_players: 1
  ]

  alias Game.Board
  alias Game.Player
  alias Game.StartGame

  def start_game(details = %StartGame{}) do
    players = for i <- 1..details.number_of_players, do: add_player(i)
    %Game{
      board: %Board{},
      players: players
    }
  end

  defp add_player(i) do
    %Player{
      name: "Player #{i}"
    }
  end
end
