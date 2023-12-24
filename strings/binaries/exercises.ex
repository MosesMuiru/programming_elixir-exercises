defmodule Exercises do
  # function that takes al ist of double qouted strings and prints each on a separate lines


  def center([]),do: "empty list"
  def center([head | tail]) do
    # first print evenrything in the lie

  IO.puts String.replace(head, ~r/"/, "")

    center(tail)
  end

  #a function that capitalises a sentense in a string


def capitalize_sentences(str) do
  sentences =
    str
    |> String.split(~r/\.\s/)
    |> Enum.map(&capitalize_sentences/1)

  Enum.join( sentences, ".") <> ". "
end

defp capitalize_sentence(sentence) do
  sentence
  |> String.replace_prefix!(&String.capitalize/1)
end
end
