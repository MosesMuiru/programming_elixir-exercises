

  _handle_open = fn
    {:ok, file} -> "this is the fiel #{IO.read(file, :file)}"
    {_, error} -> "error: #{:file.format_error(error)}"

  end


 fizz = fn
  0,0, _ -> IO.puts "fizzBuzz"
  0,_,_ -> IO.puts "fizzz"
  _,0,_ -> IO.puts "buzz"
  0,0,arg -> IO.puts( arg )
 end

 divisor = fn n ->
  fizz.(rem(n, 3), rem(n, 5), n)
 end

 string = fn arg ->
  fn second_arg -> IO.puts("#{arg} #{second_arg}") end
 end


  # hello = fn  name -> IO.puts "hello #{name} world" end

  IO.puts(fizz.(0,0,3))
  IO.puts(divisor.(10))
  first = string.("moses")
  second = first.("njoroge")

# iello.("moses")
