defmodule Game.StartGame do
  defstruct [
    number_of_players: 1
  ]

  alias Game.{Board, Cards, Player, StartGame}

  def start_game(details = %StartGame{}) do
    players = for i <- 1..details.number_of_players, do: add_player(i)
    %Game{
      board: %Board{
        shield_officers: create_shield_officers_deck(),
        wounds: create_wounds_deck(),
      },
      players: players
    }
  end

  defp add_player(i) do
    agents = for _ <- 1..8, do: Cards.Shield.create(:shield_agent)
    troopers = for _ <- 1..4, do: Cards.Shield.create(:shield_trooper)

    deck = [agents, troopers]
      |> List.flatten()
      |> Enum.shuffle()

    %Player{
      name: "Player #{i}",
      deck: deck
    } |> Player.draw_hand()
  end

  defp create_shield_officers_deck do
    for _ <- 1..30, do: Cards.Shield.create(:shield_officer)
  end

  defp create_wounds_deck do
    for _ <- 1..30, do: Cards.Wound.create()
  end
end
