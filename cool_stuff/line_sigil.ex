defmodule LineSigil do

  @doc """
  this should take a sentence and converts it to the a string based on different lines

  """

  def sigil_l(lines, _opts) do
    lines |> String.trim_leading() |> String.split("\n")
  end

end

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
IO.inspect(Example.lines())
