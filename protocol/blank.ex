defprotocol Blank do
    def blank?(data)

    
end


# this is how you implement the protocol

defimpl Blank, for: List do
    def blank([]), do: true
    def blank(_), do: false
end

defimpl Blank, for: BitString do
    def blank(""), do: true
    def blank(_), do: false
end

# you can also use it to manupulate the datatypes 
# examples


defprotocol ChangeType do
    def to_atom(data)
end

defimpl ChangeType do

    def to_atom("name")     
end