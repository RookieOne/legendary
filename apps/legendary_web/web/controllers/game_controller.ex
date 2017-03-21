defmodule LegendaryWeb.GameController do
  use LegendaryWeb.Web, :controller

  alias LegendaryWeb.GameRecord
  alias Game.StartGame

  def index(conn, _params) do
    games = Repo.all(GameRecord)
    render conn, "index.html", games: games
  end

  def show(conn, %{"id" => id}) do
    case GameRecord.load(id) do
      {:ok, game_record, game} ->
        render conn, "show.html", game_record: game_record, game: game
      _ ->
        conn
        |> put_flash(:error, "Could not load game #{id}")
        |> render("index.html")
    end
  end

  def create(conn, _params) do
    game = StartGame.start_game(%StartGame{number_of_players: 2})
    case GameRecord.save(game) do
      {:ok, record} ->
        redirect conn, to: game_path(conn, :show, record.id)
      {:error, message} ->
        redirect conn, to: game_path(conn, :index)
    end
  end
end
