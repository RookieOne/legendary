defmodule LegendaryWeb.Repo.Migrations.CreateGameRecord do
  use Ecto.Migration

  def change do
    create table(:games) do
      add :state, :json

      timestamps()
    end
  end
end
