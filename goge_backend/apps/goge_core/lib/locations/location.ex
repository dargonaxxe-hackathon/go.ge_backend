defmodule GoGeCore.Location do
  @moduledoc false

  use Ecto.Schema

  # todo localization
  schema "location" do
    field :name, :string
  end
end
