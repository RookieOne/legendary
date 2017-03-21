defmodule LegendaryWeb.GameRecordTest do
  use LegendaryWeb.ModelCase

  alias Game.StartGame
  alias LegendaryWeb.{GameRecord, Repo}

  test "can save game state" do
    game = StartGame.start_game(%StartGame{number_of_players: 2})

    record = %GameRecord{
      state: Poison.encode!(game)
    } |> Repo.insert!

    assert record.id != nil

    read_record = Repo.get(GameRecord, record.id)

    assert read_record == record
  end
end
