# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of the Config module.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
import Config

# Sample configuration:
#
#     config :logger, :console,
#       level: :info,
#       format: "$date $time [$level] $metadata$message\n",
#       metadata: [:user_id]
#

config :goge_core, ecto_repos: [GoGeCore.Repo]

config :goge_core, GoGeCore.Repo,
  database: "goge_dev",
  username: "postgres",
  password: "postgres",
  hostname: "127.0.0.1"
