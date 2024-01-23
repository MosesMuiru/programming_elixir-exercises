defmodule IsCollection do
#  here you define the collection
    @fallback_to_any true
    def is_collection?(value)

end

# here is where you define the implementeation of that collection 
#  you define the target module name you want to implement
# then you define the type you want that implementation to take effect

defimpl IsCollection, for: [List, Tuple, BitString, Map] do
    def is_collection?(_), do: true
end

defimpl IsCollection, for: Any do
    def is_collection?(_), do: false
end

Enum.each([1, 1.0, [1,2], {1,2}, %{}, "cat"], fn value -> 
    IO.puts("#{inspect value}: -> #{IsCollection.is_collection?(value)}")
end)