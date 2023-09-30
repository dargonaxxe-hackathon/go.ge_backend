defmodule GoGe.Web.Router do
  use GoGe.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", GoGe.Web do
    pipe_through :api
    get "/locations", LocationController, :index
    post "/trip/create", TripController, :create
  end
end
