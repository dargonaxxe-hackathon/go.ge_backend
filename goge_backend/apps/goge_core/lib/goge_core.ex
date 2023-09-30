defmodule GoGe.Core do
  @repo GoGe.Core.Repo

  def get_locations(), do: @repo.all(GoGe.Core.Location)

  def get_location(id), do: @repo.get(GoGe.Core.Location, id)

  def create_driver(name, phone) do
    %GoGe.Core.User{}
    |> GoGe.Core.User.changeset(%{
      name: name,
      phone: phone
    })
    |> @repo.insert()
  end

  def create_trip(driver_id, route, departure_datetime, capacity),
    do: GoGe.Core.Trip.UseCase.CreateTrip.execute(driver_id, route, departure_datetime, capacity)

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
        where:
          t.departure_datetime <= ^end_time and t.departure_datetime >= ^begin_time and
            t.departure_id == ^departure_id and t.destination_id == ^destination_id,
        select: t
      )

    @repo.all(query)
  end

  def create_booking(passenger_id, trip_id) do
    params = %{
      passenger_id: passenger_id,
      trip_id: trip_id
    }

    GoGe.Core.Booking.changeset(%GoGe.Core.Booking{}, params)
    |> @repo.insert()
  end
end
