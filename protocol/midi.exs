defmodule Midi do

  defstruct(content: <<>>)

  defmodule Frame do
    defstruct(
      type: "xxxx",
      length: 0,
      data: <<>>
    )

    def to_binary(%Midi.Frame{type: type, length: length, data: data}) do
      <<
      type::binary-4,
      length::integer-32,
      data::binary
      >>
    end
  end

  def from_file(file_name) do
    %Midi{content: File.read!(file_name)}
  end


end

defprotocol MyEnumerable do
  def count(collection)
  def member?(collection, value)
  def reduce(collection, acc, return_function)
  def slice(collection)

end

defimpl MyEnumerable, for: Midi do

  def _reduce(_content, {:halt, acc}, _fun) do
   {:halted, acc}
  end

  def _reduce(content, {:suspend, acc}, return_fun) do
    {:suspended, acc, &_reduce(content, &1, return_fun)}
  end

  def _reduce(_content = "", {:cont, acc}, _fun) do
      {:done, acc}
  end

  def _reduce(<<
  type::binary-4,
  length::integer-32,
  data::binary-size(length),
  rest::binary
  >>,
  {:cont, acc},
   fun) do
     frame = %Midi.Frame{type: type, length: length, data: data}
     _reduce(rest, fun.(frame, acc), fun)
   end

   def reduce(%Midi{content: content}, state, fun) do
     _reduce(content, state, fun)
   end

  #  count
  def count(midi = %Midi{}) do
    frame_count = MyEnumerable.reduce(midi, 0, fn (_, count) -> count + 1 end)
    {:ok, frame_count}
  end




end
