defmodule GoGe.Core.Booking.UseCase.GetIncomingBookings do
  @moduledoc false

  @repo GoGe.Core.Repo

  import Ecto.Query

  def execute(user_id) do
    now = NaiveDateTime.utc_now()

    trips =
      @repo.all(
        from(
          t in GoGe.Core.Trip,
          where: t.user_id == ^user_id and t.departure_datetime > ^now,
          preload: [:route, :user]
        )
      )

    Enum.map(trips, fn trip -> get_trip(trip) end)
  end

  defp get_trip(trip) do
    bookings =
      @repo.all(from(b in GoGe.Core.Booking, where: b.trip_id == ^trip.id, preload: [:passenger]))

    links = @repo.all(from(l in GoGe.Core.Route.Link, where: l.route_id == ^trip.route.id))
    {trip, bookings, links}
  end
end
