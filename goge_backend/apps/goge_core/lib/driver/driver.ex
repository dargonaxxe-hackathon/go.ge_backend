defmodule GoGeCore.Driver do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  schema "driver" do
    field(:name, :string)
    field(:phone, :string)
    timestamps()
  end

  def changeset(driver, attrs) do
    driver
    |> cast(attrs, [:name, :phone])
    |> validate_required([:name, :phone])
  end
end
