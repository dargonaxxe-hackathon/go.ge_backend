defmodule :"Elixir.GoGe.Core.Repo.Migrations.RouteAdd-tables" do
  use Ecto.Migration

  def change do
    create table("route") do
      add :trip_id, references("trips"), null: false
      timestamps()
    end
    create table("link") do
      add :route_id, references("route"), null: false
      add :departure_id, references("locations"), null: false
      add :destination_id, references("locations"), null: false
      add :index, :integer
      timestamps()
    end
  end
end
