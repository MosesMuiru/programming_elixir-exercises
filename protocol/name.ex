defprotocol PrintName do
    @fallback_to_any true
    def print(name)

end

defimpl PrintName, for: Any do
    def other do
        IO.inspect "wee ishia"
    end
    def print(name) do
        IO.inspect name
        other()
    end

end

PrintName.print("moses")