defmodule :"Elixir.GoGe.Core.Repo.Migrations.DriverAlter-rename-users" do
  use Ecto.Migration

  def change do
    rename table("driver"), to: table("users")
  end
end