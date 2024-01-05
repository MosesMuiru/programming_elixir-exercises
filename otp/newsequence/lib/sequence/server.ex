defmodule Sequence.Server do
  # this is the server that will hnadle everything

  use GenServer
  alias Sequence.Impl
  def init(initial_state) do
    {:ok, initial_state}

  end

  def handle_call(:next_number, _from, current_number) do
    {:reply, current_number , Impl.next_number}

  end

  def handle_cast({:increment_number, delta}, current_state) do
    {:noreply, Impl.increment_number(delta)}
  end

end
