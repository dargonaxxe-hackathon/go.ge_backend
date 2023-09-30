defmodule GoGe.Web.Router do
  use GoGe.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", GoGe.Web do
    pipe_through :api
    post "/user/", UserController, :create
    get "/locations", LocationController, :index
    post "/trip/create", TripController, :create
    post "/trip/delete", TripController, :delete
    post "/trip/lookup", TripController, :lookup
    post "/trip/published", TripController, :published
    post "/booking/incoming/", BookingController, :incoming
    post "/booking/approve/", BookingController, :approve
    post "/booking/create/", BookingController, :create
    post "/booking/outcoming", BookingController, :outcoming
    post "/booking/reject", BookingController, :reject
  end
end
