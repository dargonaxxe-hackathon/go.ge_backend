defmodule GoGe.Core.Location.PopulateService do
  @moduledoc false
  use GenServer
  @repo GoGe.Core.Repo

  @impl GenServer
  def init(_), do: {:ok, nil, {:continue, :populate_table}}

  def start_link(_), do: GenServer.start_link(__MODULE__, nil)

  @impl GenServer
  def handle_continue(:populate_table, _) do
    GoGe.Core.Location.values()
    |> Enum.each(fn x -> @repo.insert(x, on_conflict: :nothing) end)

    {:noreply, nil}
  end
end
