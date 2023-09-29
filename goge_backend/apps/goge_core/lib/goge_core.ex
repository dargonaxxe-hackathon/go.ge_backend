defmodule GoGeCore do
  @repo GoGeCore.Repo

  def get_locations(), do: GoGeCore.Location.values()

  def create_driver(name, phone) do
    %GoGeCore.Driver{}
    |> GoGeCore.Driver.changeset(%{
      name: name,
      phone: phone
    })
    |> @repo.insert()
  end

  def create_trip(driver_id, departure_id, destination_id, departure_datetime, capacity) do
    params = %{
      driver_id: driver_id,
      departure_id: departure_id,
      destination_id: destination_id,
      departure_datetime: departure_datetime,
      capacity: capacity
    }
    GoGeCore.Trip.changeset(%GoGeCore.Trip{}, params)
    |> @repo.insert()
  end

  def delete_trip(trip_id) do
    @repo.get(GoGeCore.Trip, trip_id)
    |> @repo.delete()
  end
end
