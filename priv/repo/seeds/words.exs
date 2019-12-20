alias Rhyming.{Word, Repo, WordParser}

contents = File.read!("./data/cmudict-0.7b")
lines = WordParser.split_lines(contents)

Enum.each(lines, fn line ->
  word = WordParser.parse_word(line)
  word = Repo.insert!(word)
end)
