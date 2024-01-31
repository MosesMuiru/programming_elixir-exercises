defmodule VSigil do

  def sigil_v(data, _opts) do
    data
    |> String.trim_trailing()
    |> String.split("\n")
    |> Enum.map(fn x -> String.split(x, " ")  end)
  end

end

defmodule Example do
  import VSigil

  def names do
    ~v"""
      moses
      this is new
      welcome
    """
  end
end


IO.inspect(Example.names())
