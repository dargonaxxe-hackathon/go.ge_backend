defmodule GoGe.Core.Booking.UseCase.GetIncomingBookings do
  @moduledoc false

  @repo GoGe.Core.Repo

  import Ecto.Query

  def execute(user_id) do
    now = NaiveDateTime.utc_now()
    trips = @repo.all(
      from(
        t in GoGe.Core.Trip,
        where: t.user_id == ^user_id and t.departure_datetime > ^now
      )
    )
    Enum.map(trips, fn trip -> {trip, @repo.all(from(b in GoGe.Core.Booking, where: b.trip_id == ^(trip.id)))} end)
  end
end
