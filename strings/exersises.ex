defmodule Exercises do

    # function tha returns true if the charaterlist contains nonpritable asci charater

    @doc """
    graphemes - returns a string in form of a list of characters
    """

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

  this is my solution

  loop on the list of charaters
  if + do addiong
  """
  def calculate(str) do
    # regex for extracting the sigth
    # count the first elements until a sign is shown
    first_part = for first <- str do
      case str do
       "+" -> add()

      end
    end
    #  when a sign is shown it will split
    #  take the first part and put it aside
    # take the second part and put it aside
    # convert on side to interger
    # the do the calculation as planned
  end

end
