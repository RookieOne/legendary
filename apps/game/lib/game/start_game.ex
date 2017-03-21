defmodule Game.StartGame do
  defstruct [
    number_of_players: 1
  ]

  alias Game.Board
  alias Game.HeroCard
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
    agents = for _ <- 1..8, do: HeroCard.create(:shield_agent)
    troopers = for _ <- 1..4, do: HeroCard.create(:shield_trooper)

    %Player{
      name: "Player #{i}",
      deck: List.flatten(agents, troopers)
    }
  end
end
