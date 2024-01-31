defmodule Example do
  import LineSigil
  def lines do
    ~l"""
    line 1
    line 2
    welcome to this first move
    """
  end


end
IO.inspect Example.lines
  