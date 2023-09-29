defmodule GoGe.Core.Booking do
  @moduledoc false
  use Ecto.Schema

  schema "booking" do
    belongs_to(:passenger, GoGe.Core.User)
    field(:trip_id, :id)
    field(:status, Ecto.Enum, values: [:pending, :rejected, :declined, :accepted])
  end

  import Ecto.Changeset

  def changeset(booking, params) do
    booking
    |> cast(params, [:passenger_id, :trip_id, :status])
    |> validate_required([:passenger_id, :trip_id])
  end
end
