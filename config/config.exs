# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :test_project,
  ecto_repos: [TestProject.Repo]

# Configures the endpoint
config :test_project, TestProjectWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "H0XieOyXgFlJ/L01Q10eIg6V2hUZPVCfCapqTETT9V7rK9faT/bqYw77/TpXBWlr",
  render_errors: [view: TestProjectWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: TestProject.PubSub,
  live_view: [signing_salt: "0ZbW74R3"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
