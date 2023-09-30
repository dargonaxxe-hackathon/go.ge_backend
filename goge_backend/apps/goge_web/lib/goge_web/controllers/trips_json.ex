defmodule GoGe.Web.TripJSON do
  @moduledoc false

  def create(%{trip_id: trip_id}), do: %{trip_id: trip_id}

  def delete(%{}), do: %{success: true}

  def lookup(%{trips: trips}) do
    Enum.map(trips, fn {trip, links} -> map_trip(trip, links) end)
  end

  defp map_trip(trip, links) do
    IO.puts(inspect(trip))
    IO.puts("\n\n\n")
    %{
      id: trip.id,
      driver: %{
        id: trip.user.id,
        name: trip.user.name,
        phone: trip.user.phone
      },
      datetime: trip.departure_datetime,
      route: map_links(links, [])
    }
  end

  defp map_links([link], result), do: [%{id: link.departure_id}, %{id: link.destination_id} | result]
  defp map_links([link | tail], result), do: map_links(tail, [%{id: link.departure_id} | result])
end
