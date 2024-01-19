defmodule Tracer do

  def dump_args(args) do
    args |> Enum.map(&inspect/1) |> Enum.join(", ")
  end

  def dump_defn(name, args) do
    "#{name}(#{dump_args(args)})"
  end
  defmacro def(defination={name, _, args}, do: content) do
  IO.inspect defination
  quote do
    Kernel.def(unquote(defination)) do

      IO.puts "--> call: #{Tracer.dump_defn(unquote(name), unquote(args))}"
      results = unquote(content)
      colourd = IO.ANSI.format([:blue_background, "#{results}"])
      IO.puts("the results --> #{colourd}")

    

    end
  
  end
end
end


defmodule Test do
  import Kernel, except: [def: 2]
  import Tracer, only: [def: 2]

  def sum_them(a,b,c), do: IO.inspect(a+b+c)
end

Test.sum_them(1,2,3)

