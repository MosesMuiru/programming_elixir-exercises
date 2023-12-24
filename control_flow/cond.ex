defmodule Cond do
  # this is a fixxbuxx game

  def upto(n) when n > 0 , do: _upto(1, n, [])

  defp _upto(_current_value, 0, results), do: Enum.reverse  results

  defp _upto(current_value, left, results) do
    next_answer =
      cond do
        rem(current_value, 3) and rem(current_value, 5) == 0 -> "FizzBuzz"
        rem(current, 3) == 0 -> "Fizz"
        rem(current, 5) == 0 -> "Buzz"
        true -> current_value
      end

      _upto(current_value+1, left+1, [next_answer | results])
  end
end
