defmodule Multiple do
  @doc """
   a program that spawn two process
   ---> pass each a unique token
   --> send back the taken back
  """

# spawning two process -ie- creating two process
  def spawn_process do
   spawn(Multiple, :the_process, ["1 - THE FIRST PROCESS"])
   spawn(Multiple, :the_process, ["2 - THE SECOND PROCESS"])
  end

  # receiving resent token
  def receive_token do
    receive do
      messo -> IO.puts(" meso after imeresendiwa#{messo} \n")

    after
      3000 -> "buda imakawia saana"
    end
  end

# the process to which the sending and resending will occur
  def the_process(token) do
    # receive_token()
    send(self(), "first time sending the token ---> #{token} \n")

    receive do
      messo -> IO.puts("nimepata hii messo ---> #{inspect messo} ---")
      send(self(), "am resending thee meso ---> #{messo} <---")

    after
      3000 -> "buda imakawia saana"
    end

#  recurse in order to receive more tokens that are to come
    receive_token()
  end
end
