defmodule GoGeCore.Repo do
  use Ecto.Repo,
    otp_app: :goge_core,
    adapter: Ecto.Adapters.Postgres
end
