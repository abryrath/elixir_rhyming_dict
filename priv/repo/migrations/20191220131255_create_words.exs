defmodule Rhyming.Repo.Migrations.CreateWords do
  use Ecto.Migration

  def change do
    create table(:words) do
      add :word, :string, null: false
      add :phonemes, :string, null: false
      add :rhyming_phonemes, :string, null: false
    end
  end
end
