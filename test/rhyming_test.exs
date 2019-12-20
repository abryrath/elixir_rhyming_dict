defmodule RhymingTest do
  use ExUnit.Case
  doctest Rhyming

  test "greets the world" do
    assert Rhyming.hello() == :world
  end
end
