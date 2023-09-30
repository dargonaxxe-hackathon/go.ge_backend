defmodule GoGe.Web.BookingJSON do
  @moduledoc false

  def incoming(%{result: result}) do
    Enum.map(result, fn {trip, bookings, links} -> map_incoming(trip, bookings, links) end)
  end

  alias GoGe.Web.Helpers

  defp map_incoming(trip, bookings, links) do
    %{
      route: Helpers.map_trip(trip, links),
      datetime: trip.departure_datetime,
      id: trip.id,
      wallet: trip.wallet_address,
      cost: trip.cost,
      bookings: Enum.map(bookings, fn booking -> map_booking(booking) end)
    }
  end

  defp map_booking(booking) do
    %{
      passenger: %{
        id: booking.passenger.id,
        name: booking.passenger.name,
        phone: booking.passenger.phone
      },
      status: booking.status
    }
  end
end