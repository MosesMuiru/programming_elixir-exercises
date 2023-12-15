defmodule Ranging do

  def my_guess(number, a..b = range ) do
    sum = a+b
    my_number = sum/2

    case my_number do
      ^number = my_number  -> number
      number > my_number ->
        # my_guess(number,my_number..b)
        greater_half(number, my_number..b)
     number < my_number ->
      # a..b = a..my_number
      my_guess(number, a..my_number)
      less_half(number, a..my_number)

    end
  end

 



  # # this if the function when the number is greater than half the range
  def greater_half(number, a..b) do


    my_number = b/2

    if my_number == number do
      number
    else
      greater_half(number, my_number)

    end
  end

  # this is for the number that is less than the half amount

  def less_half(number, a..b) do
    my_number = div(b,2)

    if my_number == number do
      my_number
    else
      less_half(number, a..my_numbera)
    end
  end

end
