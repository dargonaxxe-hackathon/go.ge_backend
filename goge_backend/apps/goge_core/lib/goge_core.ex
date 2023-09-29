defmodule GoGe.Core do
  @repo GoGe.Core.Repo

  def get_locations(), do: GoGe.Core.Location.values()

  def create_driver(name, phone) do
    %GoGe.Core.Driver{}
    |> GoGe.Core.Driver.changeset(%{
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

    GoGe.Core.Trip.changeset(%GoGe.Core.Trip{}, params)
    |> @repo.insert()
  end

  def delete_trip(trip_id) do
    @repo.get(GoGe.Core.Trip, trip_id)
    |> @repo.delete()
  end

  import Ecto.Query

  def get_trips(departure_id, destination_id, date) do
    begin_time = NaiveDateTime.beginning_of_day(date)
    end_time = NaiveDateTime.end_of_day(date)

    query =
      from(t in GoGe.Core.Trip,
        where: t.departure_datetime <= ^end_time and t.departure_datetime >= ^begin_time,
        select: t
      )

    @repo.all(query)
  end
end
