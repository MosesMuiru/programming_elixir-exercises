defmodule Sequence.Impl do
  use GenServer

  @server Sequence.Server

  def start_link(current_number) do
    GenServer.start_link(@server, current_number, name: @server)
  end

  # define the function that will the next number
  # .call ----> will go the server and call the handle_call



  def next_number do
    GenServer.call(:next_number, @server)
  end

  def increment_number(delta) do
    GenServer.call(:increment_number, {:increment_number + delta} )
  end

  

end
