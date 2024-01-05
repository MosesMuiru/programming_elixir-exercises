defmodule NewsequenceTest do
  use ExUnit.Case
  doctest Newsequence

  test "greets the world" do
    assert Newsequence.hello() == :world
  end
end
