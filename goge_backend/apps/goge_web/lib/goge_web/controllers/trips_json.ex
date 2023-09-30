defmodule GoGe.Web.TripJSON do
  @moduledoc false

  def create(%{trip_id: trip_id}), do: %{trip_id: trip_id}

  def delete(%{}), do: %{success: true}
end
