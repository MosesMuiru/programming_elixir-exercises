defmodule Spawn1 do

  @doc """
  this is what is happening here

  receive will look for functions  that are in the mail box
   then after receiving a function and from the sender it will send a reply
   send( pid and a reply)
  """
  def greet do
    receive do
      {sender, message} ->
        send(sender, { :ok, "hello this is the message --> #{message}"})
    end


  end

  def factorial(n), do: _fact(n, 1)
  def _fact(0, fact), do: fact
  def _fact(n, fact), do: _fact(n-1, fact-1)

end

# spawn the function to get the pid
