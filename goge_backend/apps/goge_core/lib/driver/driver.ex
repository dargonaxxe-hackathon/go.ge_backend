defmodule GoGeCore.Driver do
  @moduledoc false
  use Ecto.Schema

  schema "driver" do
    field :name, :string
    field :phone, :string
    timestamps()
  end
end
