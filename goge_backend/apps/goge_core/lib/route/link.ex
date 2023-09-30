defmodule GoGe.Core.Route.Link do
  @moduledoc false
  use Ecto.Schema

  schema "link" do
    belongs_to(:route, GoGe.Core.Route)
    field(:departure_id, :id)
    field(:destination_id, :id)
    field(:index, :integer)
    timestamps()
  end

  @fields [:route_id, :departure_id, :destination_id, :index]
  import Ecto.Changeset

  def changeset(link, params) do
    link
    |> cast(params, @fields)
    |> validate_required(@fields)
  end
end
