defmodule Rhyming.WordParser do
  alias Rhyming.{Word, Repo}

  @spec split_lines(binary) :: [binary]
  def split_lines(str) do
    str
    |> String.split(~r/\n/)
    |> Enum.filter(fn line -> String.length(line) > 0 end)
    |> Enum.filter(fn line -> !String.starts_with?(line, ";") end)
  end

  @spec parse_word(binary) :: Ecto.Changeset.t()
  def parse_word(str) do
    {word_rep, phonemes} = split_word_phonemes(str)
    rhyming = get_rhyming_phonemes(phonemes)

    Word.changeset(%Word{}, %{
      "word" => word_rep,
      "phonemes" => phonemes,
      "rhyming_phonemes" => rhyming
    })
  end

  @spec split_word_phonemes(binary) :: {binary, binary}
  def split_word_phonemes(str) do
    [word_rep, phonemes] = String.split(str, "  ")
    {word_rep, phonemes}
  end

  def get_rhyming_phonemes(phonemes) do
    arr = phonemes |> String.split(" ")
    get_rhyming_phonemes_p(arr)
  end

  defp get_rhyming_phonemes_p(arr, result \\ [])

  defp get_rhyming_phonemes_p([], result) do
    result
    |> Enum.reverse()
    |> Enum.join(" ")
  end

  defp get_rhyming_phonemes_p(arr, []) do
    [head|tail] = arr

    cond do
      Regex.match?(~r/\d/, head) -> get_rhyming_phonemes_p(tail, [head])
      true -> get_rhyming_phonemes_p(tail, [])
    end
  end

  defp get_rhyming_phonemes_p(arr, result) do
    [head|tail] = arr
    get_rhyming_phonemes_p(tail, [head|result])
  end
end
