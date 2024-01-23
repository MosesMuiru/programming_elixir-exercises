defprotocol Caeser do

    def encrypt(string, shift)

    def rot13(string)
  
end
# the implementation

defimpl Caeser, for: BitString do


    
    def encrypt(string, shift) do
        # the string from a - z
    end
  
end

defimpl Caeser, for: BitString do
    def rot13(string) do

    end

end