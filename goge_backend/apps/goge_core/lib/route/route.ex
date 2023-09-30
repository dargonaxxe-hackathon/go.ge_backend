defmodule GoGe.Core.Route do
  @moduledoc false
  use Ecto.Schema

  schema "route" do
    belongs_to(:trip, GoGe.Core.Trip)
    has_many(:link, GoGe.Core.Route.Link)
    timestamps()
  end

  @fields [:trip_id]
  import Ecto.Changeset

  def changeset(route, params) do
    route
    |> cast(params, @fields)
    |> validate_required(@fields)
  end
end
