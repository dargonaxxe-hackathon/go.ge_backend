defmodule GoGe.Core.Trip do
  use Ecto.Schema

  schema "trips" do
    belongs_to(:user, GoGe.Core.User)
    field(:departure_datetime, :naive_datetime)
    field(:capacity, :integer)
    field(:wallet_address, :string)
    field(:cost, :string)
    has_one(:route, GoGe.Core.Route)

    timestamps()
  end

  import Ecto.Changeset

  @fields [:user_id, :departure_datetime, :capacity, :wallet_address, :cost]

  def changeset(trip, params) do
    trip
    |> cast(params, @fields)
    |> validate_required(@fields)
  end
end
