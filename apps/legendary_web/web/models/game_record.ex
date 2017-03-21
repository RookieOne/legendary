defmodule LegendaryWeb.GameRecord do
  use LegendaryWeb.Web, :model

  alias LegendaryWeb.{GameRecord, Repo}

  schema "games" do
    field :state, LegendaryWeb.Json.Type

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [])
    |> validate_required([])
  end

  def save(game = %Game{}) do
    Repo.insert(%GameRecord{state: Poison.encode!(game)})
  end

  def load(id) do
    game_record = Repo.get(GameRecord, id)
    game = Poison.decode!(game_record.state)
    {:ok, game_record, game}
  end
end
