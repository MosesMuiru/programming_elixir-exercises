defmodule Sequence.Server do
  use GenServer

  def init(initial_number) do
    {:ok, initial_number}
  end

  def handle_call(:next_number, _from, currenct_number) do
    {:reply, currenct_number, currenct_number + 1}

  end

end
