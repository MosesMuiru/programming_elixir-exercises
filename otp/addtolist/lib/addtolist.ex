defmodule Addtolist do
 @doc """
  to increament a number
 """
@me __MODULE__
 def start_link(current_number) do

  GenServer.start_link(@me, current_number, name: __MODULE__)
 end

 def next_number do
   GenServer.call(@me, :next_number)
 end

 def increment_value(number) do
   GenServer.cast(@me, {:increment_value, number})

 end

#  the server side of the this

def init(current_value) do

  {:ok, current_value}
end

def handle_call(:next_number, _from, current_value) do
  {:reply, current_value + 1, current_value}
end

def handle_cast({:increment_value, number}, current_value) do
  {:no_reply, current_value + number}
end
end
