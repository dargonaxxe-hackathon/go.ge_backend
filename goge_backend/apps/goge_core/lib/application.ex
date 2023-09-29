defmodule GoGe.Core.Application do
  @moduledoc false
  use Application

  @impl Application
  def start(_, _) do
    children = [
      {GoGe.Core.Repo, []},
      {GoGe.Core.Location.PopulateService, []}
    ]

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
