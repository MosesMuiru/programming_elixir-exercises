defmodule Multiple do
  @doc """
   a program that spawn two process
   ---> pass each a unique token
   --> send back the taken back
  """

  # first process



  def spawn_process do
      first_pid = spawn(&echo_token/0)
      second_pid = spawn(&echo_token/0)

      # sendin unique
      send(first_pid, "mosess")
      send(second_pid, "faurlll")

      # receive token
      first_token = receive_token(first_pid)
      second_token = receive_token(second_pid)

      # resuts

      IO.puts("first  #{first_token} second #{second_token}")




  end

  # for recieving the token and sending it back
  def echo_token do
    receive do
      {:token, token} ->
        IO.puts("the tokenn -----> #{token}")
        send(self(), {:token, token})

    end
  end

  def receive_token(pid) do
    receive do
      {:token, token} when self() == pid -> token
    end
  end


end
