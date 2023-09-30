defmodule GoGe.Web.TripController do
  @moduledoc false
  use GoGe.Web, :controller
  alias GoGe.Web.Helpers

  def create(conn, params) do
    with driver_id <- params["driver_id"],
         route <- params["route"],
         departure_datetime <- Helpers.convert_datetime(params["departure_datetime"]),
         capacity <- params["capacity"],
         {:ok, result} <- GoGe.Core.create_trip(driver_id, route, departure_datetime, capacity) do
      render(conn, :create, trip_id: result.id)
    end
  end
end