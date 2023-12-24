defmodule Fizzing do

  # write fizzbuzz using case

  def upto(n) when n > 0 do
    1..n |> Enum.map(&fizzing/1)
  end

  def fizzing(n) do

    case rem(n, 3) == 0 and rem(n, 5) == 0 do

      true -> "#{n} FizzBuzz"
      false ->
        case rem(n, 3) == 0 do
           true -> " #{n}  Fizz"
           false ->
            case rem(n, 5) == 0 do
               true -> " #{n}  Buzz"
               false -> " #{n}  wwee ishia"

            end

        end
      end
  end
end
