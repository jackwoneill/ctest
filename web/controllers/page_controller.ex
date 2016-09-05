defmodule Ctest.PageController do
  use Ctest.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
