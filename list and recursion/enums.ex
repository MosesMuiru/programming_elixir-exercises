defmodule Enums do
  # implementing the all? each? filter?, split and take

  @doc """
  all - this should ouput all the element in list


  """

  def all([]), do: []
  def all([head | tail]) do

    [head | all(tail)]
end

# each should print out each element in the list individualy

  def each([]) , do: []

  def each([ head | tail]) do
    IO.inspect(head)
    each(tail)
  end
    # this should out the given output according the function given
    @doc """
    takes two aris
      one -- being the arg, and the return function that will be used to
    """

    def filter([], _my_fn) do
[]
    end
    def filter(list, my_fn) do
      [head | tail] = list
      my_fn.(head)
      filter(tail, my_fn)
    end




    def take([head | tail], number_of_returns) do
      [ head | take(tail, number_of_returns - 1)]
    end

    def take(_list, number_of_returns) when number_of_returns == 0 do
      []
    end
      # when yhou say head it will only print the first charater

      # this function is for counting if the items are already 3

      def split([], _), do: []
      def split(list, group_number)  do
        [ head | tail] = list

        new_list = [ head | split(tail, group_number)]

        if length(list) == group_number do
          new_list
        else
          [new_list | split(tail, group_number)]

        end
      end

    end
