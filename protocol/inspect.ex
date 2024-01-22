defprotocol Inspect do

    @fallback_to_any true
    def inspect(things, opts)
  
end

# here you define the implementstion of the protocol
defimpl Inspect, for: PID do

    def inspect(pid, _opts)
end