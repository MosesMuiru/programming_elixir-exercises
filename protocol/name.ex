defprotocol PrintName do
    @fallback_to_any true
    def print(name)

end

defimpl PrintName, for: Any do
    def print(name) do
        IO.inspect name
    end
end

PrintName.print("moses")