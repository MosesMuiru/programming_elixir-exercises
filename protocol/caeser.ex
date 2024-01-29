defprotocol Caeser do
# this is to define the function without 

# this is my though process
@doc """
1. have an alphabet
2. devide the alphabet into two
    3. the move one set to another list
    4. match the numbers in the list with the the right number
"""



    @fallback_to_any true
    def encrypt(string, shift)

    @fallback_to_any true
    def rot13(string)
  
end
# the implementation

defimpl Caeser, for: Bitstring do
    def rot13(value), do: IO.puts(value)
end

defimpl Caeser, for: Any do

   
    def alphabet do
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

    def encrypt(string, shift) do
        string
        |> String.split("")
        |> Enum.each(fn str -> string_position(str, shift) end)
        |> IO.inspect()        
        # (x + n ) mod 24

    end

# string position and replace it with the right one
    def string_position(string, shift) do
        # this will convert the string to a list
        # new_alphabet = alphabet()
        #     |> String.split("")

        # find the index of the string
        string_index = Enum.find_index(string, fn each_string -> each_string == string end)


        # formula of encrypting the  
      shift_number = rem((string_index + shift), 26)

        # get the string at the shift number
        value_to_be_replaced_with = get_string(shift_number)
    #   here i will find the position that is int he alphabet that is matching the same position as above


    # replace_value = Enum.at(new_alphabet, shift_number)
    String.replace(string, string, value_to_be_replaced_with )
        


    end
    # given a number or index find the index of that value

    def get_string(position) do
    
    
           string = alphabet()

            string
            |> String.split(" ")
            |> Enum.at(position)

    end
    @doc """
    [1,2,3,4,5]
    this is the shift
    [5,4,3,2,1]
    """


end

