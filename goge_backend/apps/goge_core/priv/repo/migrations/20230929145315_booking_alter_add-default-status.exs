defmodule :"Elixir.GoGe.Core.Repo.Migrations.BookingAlterAdd-default-status" do
  use Ecto.Migration

  def change do
    alter table("booking") do
      modify(:status, :string, default: "pending")
    end
  end
end
