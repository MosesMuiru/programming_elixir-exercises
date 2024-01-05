defmodule Stack do
  use GenServer

  def init(initial_stack) do
    {:ok, initial_stack}
  end

  def handle_call(:pop, _from, my_stack) do

    [head | tail] = my_stack
    {:reply, head, tail}

  end

  def handle_cast({:push, number}, my_list) do
    {:noreply, [number | my_list]}

  end

  # def format_status(_reason, [_pdict, state]) fafadfafafa
end
