defmodule Game.Player do
  defstruct [
    name: "",
    discard: [],
    deck: [],
    hand: [],
    played_cards: [],
    recruit_points: 0
  ]

  alias Game.Player

  def draw_hand(player = %Player{}, count \\ 6) do
    Enum.reduce(1..count, player, fn _, p -> draw_card(p) end)
  end

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

  def discard_card(player = %Player{}, id) do
    case find_card(player.hand, id) do
      nil ->
        {:error, "Card not found in hand to discard"}
      card ->
        %{
          player |
          hand: Enum.reject(player.hand, &(&1.id == id)),
          discard: [card|player.discard]
        }
    end
  end

  def play_card(player = %Player{}, id) do
    card = find_card(player.hand, id)

    player = find_module(card).play(card.name, player)
    %{
      player |
      played_cards: [card|player.played_cards],
      hand: Enum.reject(player.hand, &(&1.id == id)),
    }
  end

  defp find_card(cards, id), do: Enum.find(cards, &(&1.id == id))

  defp find_module(card) do
    case card.hero_name do
      "Hero" -> Cards.Shield
      "Maria Hill" -> Cards.Shield
      _ -> {:error, "Cards not found for #{card.hero_name}"}
    end
  end
end
