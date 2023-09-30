defmodule :"Elixir.GoGe.Core.Repo.Migrations.TripAlterDelete-departure-idDestination-id" do
  use Ecto.Migration

  def change do
    alter table("trips") do
      remove :departure_id
      remove :destination_id
    end
  end
end
