defmodule Rhyming.WordParserTest do
  use ExUnit.Case
  alias Rhyming.{WordParser, Word}

  @snippet """
  A42128  EY1 F AO1 R T UW1 W AH1 N T UW1 EY1 T
  AA  EY2 EY1
  AAA  T R IH2 P AH0 L EY1
  AABERG  AA1 B ER0 G
  AACHEN  AA1 K AH0 N
  AACHENER  AA1 K AH0 N ER0
  AAH  AA1
  AAKER  AA1 K ER0
  AALIYAH  AA2 L IY1 AA2
  AALSETH  AA1 L S EH0 TH
  AAMODT  AA1 M AH0 T
  AANCOR  AA1 N K AO2 R
  AARDEMA  AA0 R D EH1 M AH0
  AARDVARK  AA1 R D V AA2 R K
  AARDVARKS  AA1 R D V AA2 R K S
  AARGH  AA1 R G
  AARON  EH1 R AH0 N
  AARON'S  EH1 R AH0 N Z
  AARONS  EH1 R AH0 N Z
  AARONSON  EH1 R AH0 N S AH0 N
  AARONSON(1)  AA1 R AH0 N S AH0 N
  AARONSON'S  EH1 R AH0 N S AH0 N Z
  AARONSON'S(1)  AA1 R AH0 N S AH0 N Z
  """

  @single_line "AAA  T R IH2 P AH0 L EY1"

  test "split_word_phonemes" do
    assert {"AAA", "T R IH2 P AH0 L EY1"} == WordParser.split_word_phonemes(@single_line)
  end

  test "get_rhyming_phonemes" do
    assert "IH2 P AH0 L EY1" == WordParser.get_rhyming_phonemes("T R IH2 P AH0 L EY1")
  end

  test "changeset" do
    assert Word.changeset(%Word{}, %{
             "word" => "AAA",
             "phonemes" => "T R IH2 P AH0 L EY1",
             "rhyming_phonemes" => "IH2 P AH0 L EY1"
           }) == WordParser.parse_word(@single_line)
  end

  test "split_lines" do
    assert 23 == Enum.count(WordParser.split_lines(@snippet))
  end
end
