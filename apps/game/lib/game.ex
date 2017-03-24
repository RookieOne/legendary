defmodule Game do
  alias Game.{Board, Player}

  defstruct [
    board: %Board{},
    players: []
  ]

  def execute(game = %Game{}, {player_id, :play_card, card_id}) do
    player = game
      |> find_player(player_id)
      |> Player.play_card(card_id)

    %{
      game |
      players: update_player(game.players, player)
    }
  end

  defp update_player(players, player) do
    index = Enum.find_index(players, &(&1.id == player.id))
    List.replace_at(players, index, player)
  end

  def find_player(game, id), do: Enum.find(game.players, &(&1.id == id))
end
