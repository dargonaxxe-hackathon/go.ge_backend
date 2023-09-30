defmodule GoGe.Core.UseCase.GetOutcomingBookings do
  @moduledoc false

  @repo GoGe.Core.Repo

  import Ecto.Query

  def execute(user_id) do
    now = NaiveDateTime.utc_now()
    bookings = @repo.all(from(b in GoGe.Core.Booking, where: b.passenger_id == ^user_id))

    Enum.map(bookings, fn booking -> map_booking(booking) end)
    |> Enum.filter(fn {booking, trip, links} -> trip.departure_datetime < now end)
  end

  defp map_booking(booking) do
    trip =
      @repo.get(GoGe.Core.Trip, booking.trip_id)
      |> @repo.preload([:route, :user])

    links = @repo.all(from(l in GoGe.Core.Route.Link, where: l.route_id == ^trip.route.id))
    {booking, trip, links}
  end
end
