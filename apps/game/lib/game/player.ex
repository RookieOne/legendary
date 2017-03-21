defmodule Game.Player do
  defstruct [
    name: "",
    discard: [],
    deck: [],
    hand: [],
  ]

  alias Game.Player

  def draw_card(player = %Player{}) do
    cond do
      length(player.deck) > 0 ->
        [card|new_deck] = player.deck
        %{
          player |
          hand: [card|player.hand],
          deck: new_deck
        }
      length(player.discard) > 0 ->
        draw_card(%{player |
          deck: Enum.shuffle(player.discard),
          discard: []
        })
      true -> # else do nothing
        player
    end
  end
end
