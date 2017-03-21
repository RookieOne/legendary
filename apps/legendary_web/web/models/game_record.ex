defmodule LegendaryWeb.GameRecord do
  use LegendaryWeb.Web, :model

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
end
