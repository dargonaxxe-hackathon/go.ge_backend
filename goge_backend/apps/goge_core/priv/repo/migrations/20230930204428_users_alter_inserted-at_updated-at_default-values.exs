defmodule :"Elixir.GoGe.Core.Repo.Migrations.UsersAlterInserted-atUpdated-atDefault-values" do
  use Ecto.Migration

  def change do
    alter table("users") do
      modify :inserted_at, :utc_datetime, default: fragment("NOW()")
      modify :updated_at, :utc_datetime, default: fragment("NOW()")
    end
  end
end
