import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :goge_web, GoGe.Web.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "C/E1eBLR8UeZy0HsmqHf+nrZBECtyYU7Be1ktLJfbfzHotwotdhhkaZpxd/p2ptm",
  server: false
