defmodule :"Elixir.GoGe.Core.Repo.Migrations.LinksAlterInserted-atUpdated-atDefault-value" do
  use Ecto.Migration

  def change do
    alter table("link") do
      modify :inserted_at, :utc_datetime, default: fragment("NOW()")
      modify :updated_at, :utc_datetime, default: fragment("NOW()")
    end
  end
end
