defmodule GoGe.Core.Trip.UseCase.DeleteTrip do
  @moduledoc false

  @repo GoGe.Core.Repo

  import Ecto.Query

  def execute(trip_id) do
    trip = @repo.get(GoGe.Core.Trip, trip_id)
    route = @repo.get_by(GoGe.Core.Route, trip_id: trip_id)

    @repo.delete_all(
      from(
        l in GoGe.Core.Route.Link,
        where: l.route_id == ^route.id
      )
    )

    @repo.delete_all(
      from(
        b in GoGe.Core.Booking,
        where: b.trip_id == ^trip_id
      )
    )

    @repo.delete(route)
    @repo.delete(trip)
  end
end
