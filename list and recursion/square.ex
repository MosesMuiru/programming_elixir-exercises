defmodule Square do
  # this should take a sqr of a number in allist then return a new list with the sqr of the old list given

  def sqr([head | tail]) do
    [head * head | sqr(tail)]
  end

end
