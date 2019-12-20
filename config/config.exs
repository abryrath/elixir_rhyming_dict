import Config

config :rhyming, Rhyming.Repo,
  database: "dev_rhyming",
  username: "abryrath",
  password: "",
  hostname: "localhost"

config :rhyming, ecto_repos: [Rhyming.Repo]
