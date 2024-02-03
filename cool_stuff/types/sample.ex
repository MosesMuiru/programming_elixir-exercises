defmodule Sample do

  @spec name(string) :: non_neg_integer()
  def name(just) do
    IO.puts just
  end

  def new_name(names) do
    IO.puts("enter the name you think is right")
  end


end
Sample.name("moses")
