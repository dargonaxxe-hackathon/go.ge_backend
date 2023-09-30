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

config :goge_web,
  generators: [context_app: false]

# Configures the endpoint
config :goge_web, GoGe.Web.Endpoint,
  url: [host: "localhost"],
  render_errors: [
    formats: [json: GoGe.Web.ErrorJSON],
    layout: false
  ],
  pubsub_server: GoGe.Web.PubSub,
  live_view: [signing_salt: "o9j687mo"],
  http: [port: 4000],
  https: [
    port: 443,
    cipher_suite: :strong,
    certfile: "priv/cert/selfsigned.pem",
    keyfile: "priv/cert/selfsigned_key.pem"
  ]
#  https: [
#    port: 443,
#    cipher_suite: :strong,
#    otp_app: :goge_web,
#    keyfile: System.get_env("GOGE_SSL_KEY_PATH"),
#    certfile: System.get_env("GOGE_SSL_CERT_PATH")
#  ]

# Sample configuration:
#
#     config :logger, :console,
#       level: :info,
#       format: "$date $time [$level] $metadata$message\n",
#       metadata: [:user_id]
#

config :goge_core, ecto_repos: [GoGe.Core.Repo]

config :goge_core, GoGe.Core.Repo,
  database: "goge_dev",
  username: System.get_env("DB_PASSWORD"),
  password: System.get_env("DB_USER"),
  hostname: System.get_env("DB_HOST"),
  log: false

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"

config :goge_web, :generators, context_app: :goge_core
