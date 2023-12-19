defmodule Maximum do

  def max([]), do: 0
  def max([head | tail]) do

    tail_max = max(tail)
    if head > tail_max do
      head
    else
      tail_max
    end
  end

  def sum([]), do: 0

 def sum([head | tail]) do
  head + sum(tail)
 end
end
