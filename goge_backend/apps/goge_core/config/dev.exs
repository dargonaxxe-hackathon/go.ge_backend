use Mix.Config

config :goge_core, GoGeCore.Repo,
  database: "goge_dev",
  username: "postgres",
  password: "postgres",
  hostname: "172.17.0.2"