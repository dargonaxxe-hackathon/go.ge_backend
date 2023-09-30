defmodule :"Elixir.GoGe.Core.Repo.Migrations.TripAlterAdd-walletAdd-cost" do
  use Ecto.Migration

  def change do
    alter table("trips") do
      add :wallet_address, :string
      add :cost, :string
    end
  end
end
