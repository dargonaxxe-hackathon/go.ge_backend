defmodule MonkeyTest do
  @moduledoc false

  @repo GoGe.Core.Repo

  def create_trip() do
    drivers = @repo.all(GoGe.Core.User)
    driver = hd(drivers)
    locations = @repo.all(GoGe.Core.Location)
    [location_one | tail] = locations
    [location_two | tail] = tail
    [location_three | tail] = tail
    route = [location_one.id, location_two.id, location_three.id]
    departure_datetime = NaiveDateTime.utc_now()
    capacity = 3
    GoGe.Core.create_trip(driver.id, route, departure_datetime, capacity)
  end
end
