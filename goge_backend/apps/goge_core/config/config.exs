use Mix.Config

import_config "#{Mix.env()}.exs"

config :goge_core, ecto_repos: [GoGeCore.Repo]