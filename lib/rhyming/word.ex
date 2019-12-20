defmodule Rhyming.Word do
  use Ecto.Schema
  import Ecto.Changeset

  schema "words" do
    field :word, :string
    field :phonemes, :string
    field :rhyming_phonemes, :string
  end

  def changeset(struct, params) do
    struct
    |> cast(params, [:word, :phonemes, :rhyming_phonemes])
    |> validate_required([:word, :phonemes, :rhyming_phonemes])
  end
end
