defmodule GoGe.Core.Trip.UseCase.CreateTrip do
  @moduledoc false
  @repo GoGe.Core.Repo

  def execute(driver_id, route_links, departure_datetime, capacity) do
    trip_params = prepare_trip_params(driver_id, departure_datetime, capacity)
    {:ok, trip} = GoGe.Core.Trip.changeset(%GoGe.Core.Trip{}, trip_params) |> @repo.insert()
    route_params = prepare_route_params(trip.id)
    {:ok, route} = GoGe.Core.Route.changeset(%GoGe.Core.Route{}, route_params) |> @repo.insert()
    iterate(route_links, route.id, 0)
    {:ok, trip}
  end

  defp iterate([_], _, _), do: :ok

  defp iterate([departure_id | tail], route_id, index) do
    [destination_id | _] = tail
    params = prepare_link_params(route_id, departure_id, destination_id, index)

    {:ok, _} =
      GoGe.Core.Route.Link.changeset(%GoGe.Core.Route.Link{}, params)
      |> @repo.insert()

    iterate(tail, route_id, index + 1)
  end

  defp prepare_link_params(route_id, departure_id, destination_id, index) do
    %{
      route_id: route_id,
      departure_id: departure_id,
      destination_id: destination_id,
      index: index
    }
  end

  defp prepare_route_params(trip_id) do
    %{
      trip_id: trip_id
    }
  end

  defp prepare_trip_params(driver_id, departure_datetime, capacity) do
    %{
      user_id: driver_id,
      departure_datetime: departure_datetime,
      capacity: capacity
    }
  end
end
