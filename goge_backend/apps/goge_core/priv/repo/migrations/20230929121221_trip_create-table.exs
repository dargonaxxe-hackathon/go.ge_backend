defmodule :"Elixir.GoGeCore.Repo.Migrations.TripCreate-table" do
  use Ecto.Migration

  def change do
    create table("trips") do
      add :driver_id, references("driver"), null: false
      add :departure_id, references("locations"), null: false
      add :destination_id, references("locations"), null: false
      add :departure_datetime, :naive_datetime
      add :capacity, :integer

      timestamps()
    end
  end
end
