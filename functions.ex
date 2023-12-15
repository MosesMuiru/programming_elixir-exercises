defmodule Functions do

  def sum(listing) do
    [head | tail] = listing

    head + sum(tail)
  end

end
