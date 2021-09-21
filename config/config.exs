# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :sky_portal,
  ecto_repos: [SkyPortal.Repo]

# Configures the endpoint
config :sky_portal, SkyPortalWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Nd3HIJJYCIoDwkg11Lbpf+kjfKK2YmzHOBcOlrQeGeB7CP3r3/Ehd/LV5WEHCIh0",
  render_errors: [view: SkyPortalWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: SkyPortal.PubSub,
  live_view: [signing_salt: "NcUUJxRj"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
