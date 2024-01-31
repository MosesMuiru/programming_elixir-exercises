defmodule VSigil do

  def sigil_v(data, _opts) do
    data
    |> String.trim_trailing()
    |> String.split("\n")
    |> Enum.map(fn x ->
      String.split(x, " ")
      |> List.delete("")
      |> List.delete("")
      |> Enum.map(fn list ->
        list
        |> String.split("")
        |> Enum.map(fn my_list ->
          cond do
             ->
              
          end
        end)
      end)
    end
      ) #tthis will remove all the spaces in the list

  end

end

defmodule Example do
  import VSigil

  def names do
    ~v"""
    1,2,3,4
      moses
      this is new
      welcome
    """
  end
end


IO.inspect(Example.names())
