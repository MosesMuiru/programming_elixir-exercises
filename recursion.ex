defmodule Recursion do
  def mapsum([head | tail] = my) do
    head + mapsum(tail)

  end
  
  def hello do
    :welcome
  end
end
