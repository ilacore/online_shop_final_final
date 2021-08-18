defmodule TestProjectWeb.PageController do
  use TestProjectWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
