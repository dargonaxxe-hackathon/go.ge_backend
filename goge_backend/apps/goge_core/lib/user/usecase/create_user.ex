defmodule GoGe.Core.User.UseCase.CreateUser do
  @moduledoc false

  @repo GoGe.Core.Repo

  def execute(user_id, name, phone) do
    GoGe.Core.User.changeset(%GoGe.Core.User{}, %{id: user_id, name: name, phone: phone})
    |> @repo.insert(on_conflict: :nothing)
  end
end
