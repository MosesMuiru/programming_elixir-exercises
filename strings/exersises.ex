defmodule Exercises do

    # function tha returns true if the charaterlist contains nonpritable asci charater

    def printable_string(str) do
      Enum.all?(String.graphemes(), &is_printable?/1)
    end


    def is_printable?(char) do
      << c::utf8>> = char
        ?\s <= c && c <= ?~
    end

    @doc """
    used to check if the world given to it are anagrams
    anagrams - a word when reverse spelled produce the same word as the original one

    """

    def anagram?(word) do
      # reverse the strring
      reversed_string = String.reverse(word)
      word == reversed_string
    end

  @doc """
  takes a single string and one is able to do some calculation on that string
  """
end
