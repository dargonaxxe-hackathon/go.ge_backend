defmodule GoGe.Core.Route.Link do
  @moduledoc false
  use Ecto.Schema

  schema "link" do
    belongs_to :route, GoGe.Core.Route
    field :departure_id, :id
    field :destination_id, :id
    field :index, :integer
    timestamps()
  end
end
