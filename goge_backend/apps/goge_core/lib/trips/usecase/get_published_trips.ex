defmodule GoGe.Core.GetPublishedTrips do
  @moduledoc false

  @repo GoGe.Core.Repo
  import Ecto.Query

  def execute(user_id) do
    now = NaiveDateTime.utc_now()

    @repo.all(
      from(t in GoGe.Core.Trip,
        where: t.user_id == ^user_id and t.departure_datetime > ^now,
        preload: [:route]
      )
    )
    |> Enum.map(fn trip -> map_trip(trip) end)
  end

  defp map_trip(trip) do
    links = @repo.all(from(l in GoGe.Core.Route.Link, where: l.route_id == ^trip.route.id))
    {trip, links}
  end
end
