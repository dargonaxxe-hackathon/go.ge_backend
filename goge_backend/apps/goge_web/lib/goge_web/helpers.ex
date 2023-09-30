defmodule GoGe.Web.Helpers do
  @moduledoc false

  def convert_date(date_string), do: NaiveDateTime.from_iso8601!(date_string <> " 00:00:00")

  def convert_datetime(datetime_string), do: NaiveDateTime.from_iso8601!(datetime_string)

  def map_trip(trip, links) do
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

  defp map_links([link], result),
    do: [%{id: link.departure_id}, %{id: link.destination_id} | result]

  defp map_links([link | tail], result), do: map_links(tail, [%{id: link.departure_id} | result])
end
