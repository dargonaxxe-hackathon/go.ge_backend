defmodule :"Elixir.GoGe.Core.Repo.Migrations.BookingCreate-table" do
  use Ecto.Migration

  def change do
    create table("booking") do
      add :passenger_id, references("users"), null: false
      add :trip_id, references("trips"), null: false
      add :status, :string
    end
  end
end
