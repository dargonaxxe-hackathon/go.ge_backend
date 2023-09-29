defmodule GoGe.Core.Booking do
  @moduledoc false
  use Ecto.Schema

  schema "booking" do
    belongs_to(:passenger, GoGe.Core.User)
    field(:trip_id, :id)
    field(:status, Ecto.Enum, values: [:pending, :rejected, :declined, :accepted])
  end
end
