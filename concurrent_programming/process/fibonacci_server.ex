defmodule FibSolverServer do

  def fib(scheduler) do
    send scheduler, {:ready, self()}

    receive do
      {:fib, n, client} ->
        send client, {:answer, n , fib_calc(n), self()}
        fib(scheduler)
      { :shutdown} -> exit( :normal)
    end
  end

  defp fib_calc(0), do: 0
  defp fib_calc(1), do: 1

  defp fib_calc(n), do: fib_calc(n-1) + fib(n-2)
end


# the sheuduler

defmodule Scheduler do
  def run(num_process, module, func, to_calculate) do
    (1..num_process)
    |> Enum.map( fn(_) -> spawn(module, func, [self()]) end)
    |> schedule_processes(to_calculate, [])
  end

  def schedule_processes(processes, queue, results) do
    receive do
      {:ready, pid} when length(queue) > 0 ->
        [next | tail] = queue
        send pid, {:fib, next, self()}
        schedule_processes(processes, tail, results)

        {:ready, pid} ->
          send pid, {:shutdown}
          if length(processes) > 1 do
            schedule_processes(List.delete(processes, pid), queue, results)
          else
            Enum.sort(results, fn {n1, _}, {n2, _} -> n1 <= n2 end)
          end

          {
            :answer, number, result, _pid
          } -> schedule_processes(processes, queue, [ {number, result} | results])
    end
  end

end

#  execution

to_process = List.duplicate(37, 20)
Enum.each 1..10, fn num_process ->
{time, result} = :timer.tc(
  Scheduler, :run,
  [num_process, FibSolverServer, :fib, to_process]
)

if num_process == 1 do
  IO.puts inspect result
  IO.puts "\n# time(s)"
end

:IO.format "~2B ~.2f~n", [num_process, time/1000000.0]
end
