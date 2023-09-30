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

  def delete_trip(trip_id), do: GoGe.Core.Trip.UseCase.DeleteTrip.execute(trip_id)

  def get_trips(departure_id, destination_id, date),
    do: GoGe.Core.UseCase.FindTrips.execute(departure_id, destination_id, date)

  def create_booking(passenger_id, trip_id) do
    params = %{
      passenger_id: passenger_id,
      trip_id: trip_id
    }

    GoGe.Core.Booking.changeset(%GoGe.Core.Booking{}, params)
    |> @repo.insert()
  end

  def get_incoming_bookings(user_id), do: GoGe.Core.Booking.UseCase.GetIncomingBookings.execute(user_id)
end
