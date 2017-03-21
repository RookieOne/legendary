defmodule LegendaryWeb.Router do
  use LegendaryWeb.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LegendaryWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    get "/games", GameController, :index
    get "/games/:id", GameController, :show
    post "/games", GameController, :create
  end

  # Other scopes may use custom stacks.
  # scope "/api", LegendaryWeb do
  #   pipe_through :api
  # end
end
