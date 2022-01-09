defmodule Exclean do
  @moduledoc """
  Documentation for `Exclean`.
  """

@doc """
Clean Names

## Examples

    iex> df = Explorer.DataFrame.from_map(%{josé: ["Valim"]})
    iex> Exclean.clean_names(df, "snake")
    #Explorer.DataFrame<
      [rows: 1, columns: 1]
      jose string ["Valim"]

"""
  def clean_names(df, "snake") do
    names = df
    |> Explorer.DataFrame.names()
    |> Enum.map(&String.replace(&1, ~r/(\.|\s)/, "_"))
    |> Enum.map(&String.downcase(&1))

    Explorer.DataFrame.rename(df, names)
  end

  defp camel_maker(list) do
    list
    |> Enum.chunk_very(1)
    |> Enum.map(&String.capitalize(&1))
  end

  def clean_names(df, "title") do
    names = df
    |> Explorer.DataFrame.names()
    |> Enum.map(&String.replace(&1, ~r/(\.|\s)/, "_"))
    |> Enum.map(&String.downcase(&1))
    |> Enum.map(&String.capitalize(&1))

    Explorer.DataFrame.rename(df, names)
  end
  end

  def clean_names(df, "title") do

  end


end
