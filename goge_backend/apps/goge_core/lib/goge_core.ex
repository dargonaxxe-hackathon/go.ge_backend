defmodule GogeCore do
  @repo GoGeCore.Repo

  def get_locations(), do: GoGeCore.Location.values()

  def create_driver(name, phone) do
    %GoGeCore.Driver{}
    |> GoGeCore.Driver.changeset(%{
      name: name,
      phone: phone
    })
    |> @repo.insert()
  end
end
