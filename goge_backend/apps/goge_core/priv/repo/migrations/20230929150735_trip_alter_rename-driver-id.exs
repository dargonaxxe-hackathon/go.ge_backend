defmodule :"Elixir.GoGe.Core.Repo.Migrations.TripAlterRename-driver-id" do
  use Ecto.Migration

  def change do
    rename table("trips"), :driver_id, to: :user_id
  end
end
