defmodule GoGe.Web.LocationController do
  use GoGe.Web, :controller

  def index(conn, _params) do
    locations = GoGe.Core.get_locations()
    render(conn, :index, locations: locations)
  end

  def show(conn, %{"id" => id}) do
    location = GoGe.Core.get_location(id)
    render(conn, :show, location: location)
  end
end
