defmodule GoGe.Core.Repo.Migrations.LocationCreate do
  use Ecto.Migration

  def change do
    create table("locations") do
      add :name, :string
    end
  end
end
