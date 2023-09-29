defmodule GoGeCore.Trip do
  use Ecto.Schema

  schema "trips" do
    belongs_to(:driver, GoGeCore.Driver)
    field(:departure_id, :id)
    field(:destination_id, :id)
    field(:departure_datetime, :naive_datetime)
    field(:capacity, :integer)

    timestamps()
  end

  import Ecto.Changeset

  @fields [:driver_id, :departure_id, :destination_id, :departure_datetime, :capacity]

  def changeset(trip, params) do
    trip
    |> cast(params, @fields)
    |> validate_required(@fields)
  end
end
