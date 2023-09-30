defmodule GoGe.Web.TripJSON do
  @moduledoc false
  alias GoGe.Web.Helpers

  def create(%{trip_id: trip_id}), do: %{trip_id: trip_id}

  def delete(%{}), do: %{success: true}

  def lookup(%{trips: trips}) do
    Enum.map(trips, fn {trip, links} -> Helpers.map_trip(trip, links) end)
  end

  def published(%{result: result}) do
    Enum.map(result, fn {trip, links} -> Helpers.map_trip(trip, links) end)
  end
end
