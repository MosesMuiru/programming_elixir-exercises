defmodule Exercises do
  # function that takes al ist of double qouted strings and prints each on a separate lines


  def center([]),do: "empty list"
  def center([head | tail]) do
    # first print evenrything in the lie

  IO.puts String.replace(head, ~r/"/, "")

    center(tail)
  end

  #a function that capitalises a sentense in a string

  def capitalize_sentences(sentence) do
    # change the sentence into a list
    sentence_as_list = String.graphemes(sentence)

    # check if there is a period so the the next two index should be capilized
    Enum.each(sentence_as_list, fn word ->
      if word == 
    end)
    # done
  end

end
