defmodule :"Elixir.GoGeCore.Repo.Migrations.DriverCreate-table" do
  use Ecto.Migration

  def change do
    create table("driver") do
      add :name, :string
      add :phone, :string
      timestamps()
    end
  end
end
