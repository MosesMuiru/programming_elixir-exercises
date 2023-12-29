defmodule Linking do
  @doc """
  the exercise

  use a spawn_link to start a process, and have that process send  a message to the parendt
  then exit immediately

  parent will sleep for 500ms,


  """


  import :timer, only: [sleep: 1]
  def parent do

    sleep(500)
    receive do
      message_from_process -> IO.puts("message --> #{message_from_process}")
    
        # code
    end


  end

  def run do

    parent_process = spawn_link(Linking, :parent, [])

    send(parent_process, "message to parent")
    exit(:bye)

  end

end
