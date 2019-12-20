defmodule Rhyming.Repo do
  use Ecto.Repo,
    otp_app: :rhyming,
    adapter: Ecto.Adapters.Postgres
end
