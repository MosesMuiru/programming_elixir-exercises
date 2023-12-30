defmodule Ticker do
  @moduledoc """
ithis module sends a notificaion every 2s.
to recieve notification a client has to register with the server
clients on different nodes can register

  """

  @interval 2000
  @name :ticker

  @doc """
  spawns the server module
  assume this Ticker is the server`
  """

  def start do
    pid = spawn(__MODULE__, :generator, [])
    :global.register_name(@name, pid)
  end

  # sends a message to the server containing the pid of the parrant node

  def register(client_pid) do
    send :global.whereis_name(@name), {:register, client_pid}
  end

  def generator(clients) do
    receive do
      {:register, pid} ->
        IO.puts "registering #{inspect pid}"
        generator([pid|clients])

      after
        @interval ->
          IO.puts "tick"
          Enum.each clients, fn client ->
            send client, {:tick }
          end
          generator(clients)
    end

  end
end
