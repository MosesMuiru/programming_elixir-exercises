defmodule Parse do

  @doc """
  patten matching the  input--- the first digit in the list
  if it is a symbol it should return the number

  """
  def number([ ?- | tail]), do: _number_digits(tail, 0) * -1
  def number([ ?+ | tail]), do: _number_digits(tail, 0)
   def number(str), do: _number_digits(str, 0)

   @doc """
   the following function should receive a
    a list, value that is is follwong


   """
  #  if list is empty it shoudl return the value
  defp _number_digits([], value), do: value

  # when the list is not empty it should
  # check if the number / digits exists in the range 0-9 then recurse untitll the last digit
  defp _number_digits([digits | tail], value) when digits in '0123456789' do
    _number_digits(tail, value * 10 + digits - ?0)

  end

  defp _number_digits([ non_digits | _], _) do
     raise "invalid digit"
  end

end

