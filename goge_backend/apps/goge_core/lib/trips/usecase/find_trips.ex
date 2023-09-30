defmodule GoGe.Core.UseCase.FindTrips do
  @moduledoc false

  @repo GoGe.Core.Repo

  import Ecto.Query

  def execute(departure_id, destination_id, date) do
    beginning_of_day = NaiveDateTime.beginning_of_day(date)
    end_of_day = NaiveDateTime.end_of_day(date)

    trips =
      @repo.all(
        from(
          t in GoGe.Core.Trip,
          where: t.departure_datetime > ^beginning_of_day and t.departure_datetime < ^end_of_day
        )
      )

    routes = Enum.map(trips, fn trip -> @repo.get_by(GoGe.Core.Route, trip_id: trip.id) end)

    Enum.map(routes, fn route ->
      @repo.all(
        from(l in GoGe.Core.Route.Link, where: l.route_id == ^route.id, order_by: l.index)
      )
    end)
    |> Enum.filter(fn links -> matches?(links, departure_id, destination_id) end)
    |> Enum.map(fn links -> get_trip(links, routes, trips) end)
  end

  defp get_trip(links, routes, trips) do
    link =
      links
      |> hd()

    route = Enum.find(routes, fn route -> route.id == link.route_id end)
    Enum.find(trips, fn trip -> trip.id == route.id end)
  end

  defp matches?([], departure_id, destination_id), do: false

  defp matches?([link | tail], departure_id, destination_id) do
    cond do
      link.departure_id == departure_id -> matches?([link | tail], destination_id)
      true -> matches?(tail, departure_id, destination_id)
    end
  end

  defp matches?([], destination_id), do: false

  defp matches?([link | tail], destination_id) do
    cond do
      link.destination_id == destination_id -> true
      true -> matches?(tail, destination_id)
    end
  end
end
