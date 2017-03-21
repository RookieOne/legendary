defmodule LegendaryWeb.PageController do
  use LegendaryWeb.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
