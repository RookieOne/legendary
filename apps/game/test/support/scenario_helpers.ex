defmodule Game.Test.ScenarioHelpers do

  def find_card_in_hand(game, player: player_name, card: card_name) do
    player = find_player(game, player_name)
    Enum.find(player.hand, &(&1.name == card_name))
  end

  def find_player(game, player_name) do
    Enum.find(game.players, &(&1.name == player_name))
  end
end
