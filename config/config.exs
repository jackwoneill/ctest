# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :ctest,
  ecto_repos: [Ctest.Repo]

# Configures the endpoint
config :ctest, Ctest.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "h5OqVBjJSrinipKk5Lrt6jWgHPqFPxMkQYPJzEJser1NeTW9w98yG7GfuNpReCkv",
  render_errors: [view: Ctest.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Ctest.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
