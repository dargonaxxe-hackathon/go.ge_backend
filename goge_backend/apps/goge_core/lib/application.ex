defmodule GoGeCore.Application do
  @moduledoc false
  use Application

  @impl Application
  def start(_, _) do
    children = [
      {GoGeCore.Repo, []},
      {GoGeCore.Location.PopulateService, []}
    ]

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
