defmodule Parallel do

  # pmap applies each fuction to the collection given

  def pmap(collection, fun) do
    me = self()
    collection
    |> Enum.map(fn (elem) ->
      spawn_link(fn -> send(me, { self(), fun.(elem)}) end)
    end)
    |> Enum.map( fn (pid) ->
      receive do
        {_pid, result} -> result
          # code
      end

    end)
  end

end
