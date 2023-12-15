defmodule Guess do

  def my_guess(number, a..b = range) do
    sum = a+b

    my_number = div(sum,2)

    # the function that will be used to compare the values

    case campare(number,my_number) do
      :equal -> number
      :greater ->
        IO.puts("is it #{my_number}")
        my_guess(number, my_number..b)
      :less ->
        IO.puts("is it #{my_number}")
        my_guess(number, a..my_number)


    end
  end

  defp campare(a,b) when a == b, do: :equal
  defp campare(a,b) when a > b, do: :greater
  defp campare(a,b) when a < b, do: :less

end
