defmodule Weather do
  @moduledoc """
  Documentation for `Weather`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Weather.hello()
      :world

  """
  def hello do
    :world
  end

  # def fetch do
  #   HTTPoison.get("https://w1.weather.gov/xml/current_obs/KALI.xml")
  #   |> parse()
  #   # |> format()
  # end

  # def parse(data) do
  #   Poison.Parse.parse!(data)
  # end

end
