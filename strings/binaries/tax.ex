defmodule Tax do
  @doc """
  write a function that reads a dn parses this and then passes the results to sales_tax function
  data should be a keyword list and that the fields need to be corrected types
  id -- integer

  """

  # reading the file in the the stram format
  def read_taxed(filename) do
    File.stream!(filename)
    |>
    formating_data()
  end

    def formating_data(tax_data) do
      Enum.each(tax_data, fn data -> IO.puts(data) end )
    end


end
