defmodule GoGeCore.Trip do
  use Ecto.Schema

  schema "trips" do
    belongs_to :driver, GoGeCore.Driver
    has_one :departure, GoGeCore.Location
    has_one :destination, GoGeCore.Location
    field(:departure_datetime, :naive_datetime)
    field(:capacity, :integer)

    timestamps()
  end
end
