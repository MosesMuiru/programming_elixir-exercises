defmodule Client do

  alias Ticker
  @doc """
  start
    --> spart the module and the reciever the module
    then pass the pid to thh register in the pud
  """



  def start do
    pid = spawn(__MODULE__, :receiver, [])

    Ticker.register(pid)
  end

  def receiver do
    receive do
      { :tick } ->
        IO.puts "tock in client"
        receiver()
    end
  end
end
