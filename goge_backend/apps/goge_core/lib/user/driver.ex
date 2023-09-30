defmodule GoGe.Core.User do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field(:name, :string)
    field(:phone, :string)
    timestamps()
  end

  def changeset(driver, attrs) do
    driver
    |> cast(attrs, [:name, :phone, :id])
    |> validate_required([:name, :phone, :id])
  end
end
