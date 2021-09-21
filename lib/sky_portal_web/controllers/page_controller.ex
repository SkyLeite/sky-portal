defmodule SkyPortalWeb.PageController do
  use SkyPortalWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
