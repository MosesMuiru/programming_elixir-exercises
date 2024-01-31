defprotocol AnotherCaeser do

    @fallback_to_any true
    def encrypt(string, shift)
end

# the implementation should contain any and bitstring type
defimpl AnotherCaeser, for: [Bitstring, Any] do
    def encrypt(string, shift) do
        string
        |> String.graphemes()
        |> Enum.each(fn str -> string_position(str, shift) end)
    end

    def alphabet do
    "abcdefghijklmnopqrstuvwxyz"
    end

# this will receive a string and shift it according to the right
    def string_shifting(string, shift) do

        new_alphabet = alphabet() |> String.graphemes()
        string_index = Enum.find_index(new_alphabet, fn each_string -> each_string == string end)

# this is the formula for getting the number that you should shift wwith
        shift_number = rem((string_index + shift), 26)

        value_to_be_replaced_with = get_string(shift_number)

        String.to_charlist(  String.replace(string, string, value_to_be_replaced_with))
        |>  IO.puts()
    end
# for getting the string in the position
    def get_string(position) do

        string = alphabet()
        string
        |> String.graphemes()
        |> Enum.at(position)
    end
end

AnotherCaeser.encrypt("a", 2)