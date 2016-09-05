defmodule Ctest.Router do
  use Ctest.Web, :router

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

  scope "/", Ctest do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/items/:id/new_instance", ItemController, :new_instance


    resources "/categories", CategoryController
    resources "/items", ItemController
    resources "/item_instances", ItemInstanceController

  end

  # Other scopes may use custom stacks.
  # scope "/api", Ctest do
  #   pipe_through :api
  # end
end
