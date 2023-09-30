defmodule GoGe.Core.Trip.UseCase.CreateTrip do
  @moduledoc false
  @repo GoGe.Core.Repo

  def execute(driver_id, route_links, departure_datetime, capacity, wallet_address, amount) do
    trip_params =
      prepare_trip_params(driver_id, departure_datetime, capacity, wallet_address, amount)

    {:ok, trip} = GoGe.Core.Trip.changeset(%GoGe.Core.Trip{}, trip_params) |> @repo.insert()
    route_params = prepare_route_params(trip.id)
    {:ok, route} = GoGe.Core.Route.changeset(%GoGe.Core.Route{}, route_params) |> @repo.insert()
    links = iterate(route_links, route.id, 0, [])
    @repo.insert_all(GoGe.Core.Route.Link, links)
    {:ok, trip}
  end

  defp iterate([_], _, _, result), do: result
  defp iterate([departure_id | tail], route_id, index, result) do
    [destination_id | _] = tail
    params = prepare_link_params(route_id, departure_id, destination_id, index)

    iterate(tail, route_id, index + 1, [params | result])
  end

  defp prepare_link_params(route_id, departure_id, destination_id, index) do
    %{
      route_id: route_id,
      departure_id: departure_id,
      destination_id: destination_id,
      index: index
    }
  end

  defp prepare_route_params(trip_id), do: %{trip_id: trip_id}

  defp prepare_trip_params(driver_id, departure_datetime, capacity, wallet_address, amount) do
    %{
      user_id: driver_id,
      departure_datetime: departure_datetime,
      capacity: capacity,
      wallet_address: wallet_address,
      cost: amount
    }
  end
end
