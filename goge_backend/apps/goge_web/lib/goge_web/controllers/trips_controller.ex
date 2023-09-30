defmodule GoGe.Web.TripController do
  @moduledoc false
  use GoGe.Web, :controller
  alias GoGe.Web.Helpers

  def create(conn, params) do
    with driver_id <- params["driver_id"],
         route <- params["route"],
         departure_datetime <- Helpers.convert_datetime(params["departure_datetime"]),
         capacity <- params["capacity"],
         wallet <- params["wallet"],
         cost <- params["cost"],
         {:ok, result} <-
           GoGe.Core.create_trip(driver_id, route, departure_datetime, capacity, wallet, cost) do
      render(conn, :create, trip_id: result.id)
    end
  end

  def delete(conn, params) do
    with trip_id <- params["trip_id"],
         {:ok, _} <- GoGe.Core.delete_trip(trip_id) do
      render(conn, :delete)
    end
  end

  def lookup(conn, params) do
    with departure_id <- params["departure_id"],
         destination_id <- params["destination_id"],
         date <- Helpers.convert_date(params["date"]),
         result <- GoGe.Core.get_trips(departure_id, destination_id, date) do
      render(conn, :lookup, trips: result)
    end
  end

  def published(conn, params) do
    with user_id <- params["user_id"],
         result <- GoGe.Core.get_published_trips(user_id) do
      render(conn, :published, result: result)
    end
  end
end
