defmodule GoGe.Core.Route do
  @moduledoc false
  use Ecto.Schema

  schema "route" do
    belongs_to :trip, GoGe.Core.Trip
    has_many :link, GoGe.Core.Route.Link
    timestamps()
  end
end
