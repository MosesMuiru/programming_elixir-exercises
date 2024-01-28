defprotocol Caeser do
# this is to define the function without 

# this is my though process
@doc """
1. have an alphabet
2. devide the alphabet into two
    3. the move one set to another list
    4. match the numbers in the list with the the right number
"""



    def encrypt(string, shift)

    def rot13(string)
  
end
# the implementation

defimpl Caeser, for: BitString do

    def encrypt(string, shift) do
        # string is the name to be passed in the function

        # the shift is the already connecteed
        # the string from a - z
        # ti should take the string and replace it with the shift
     initial_list = String.split(string, "")
     shift_list = String.split(shift, "")

    #  the above creates a list of the string
    # i want to get each string to get the number of the index of each item in the list



    end

    @doc """
    [1,2,3,4,5]
    this is the shift
    [5,4,3,2,1]
    """
end

defimpl Caeser, for: BitString do
@doc """
this is used to replace the character at the the 13 position
"""
    def rot13(string) do
        


    end

    def aphabet do
    "abcdefghijklmnopqrstuvwxyz"
    end
    # this is used to replace the number of 
    def separator(alphabet) do

        alphabet_length = String.length(alphabet)
        first_alphabet = String.slice(alphabet,0..alphabet_length/2)
        second_alphabet = String.slice(alphabet,alphabet_length/2..alphabet_length)

#       this will arrange the characters in the opposite order

        second_alphabet <> first_alphabet
        
    end
#        all i want to do is exchange the convert the string to list --> then --> this will also convert
#       then get each letter and the item 

# loop the element in the list and replace it with the the same element in that position

    def exchanger(string) do
    name = "moses"
    String.split(name, "")

    Enum.at
    # this is for the reversed / encrypted string
    String.split(string, "")
    |> Enum.each(fn element ->
    if (element == name) do

    end
     end)


    end

end