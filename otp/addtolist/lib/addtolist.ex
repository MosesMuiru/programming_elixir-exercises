defmodule Addtolist do
  use GenServer


  @doc"""

    create a server that enables  you to add items to a stack or list


  """
  def start_link(current_number) do
    GenServer.start_link(__MODULE__, current_number, name: __MODULE__)

  end

  def add_to_list(item) do

  GenServer.call(__MODULE__, {:add_to_list, item})
  end

  def pop do
   GenServer.call(__MODULE__, :pop)
  end

  # this is the server side of the

  def init(initial_list) do
   {:ok, initial_list}
  end

  def handle_call(:add_to_list, _from, current_list) do
    {:reply, current_list, current_list}
  end

  def handle_cast({:add_to_list, item}, current_list) do

    {:noreply, [item | current_list]}

  end
  end
