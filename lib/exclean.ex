defmodule Exclean do
  @moduledoc """
  Documentation for `Exclean`.
  """

@spec clean_names(Explorer.DataFrame.t(), <<_::40, _::_*24>>) :: Explorer.DataFrame.t()
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
    |> Enum.map(&Recase.to_snake(&1))

    Explorer.DataFrame.rename(df, names)
  end

  def clean_names(df, "title") do
    names = df
    |> Explorer.DataFrame.names()
    |> Enum.map(&Recase.to_title(&1))

    Explorer.DataFrame.rename(df, names)
  end

  def clean_names(df, "camel") do
    names = df
    |> Explorer.DataFrame.names()
    |> Enum.map(&Recase.to_camel(&1))

    Explorer.DataFrame.rename(df, names)
  end

  def clean_names(df, "constant") do
    names = df
    |> Explorer.DataFrame.names()
    |> Enum.map(&Recase.to_constant(&1))

    Explorer.DataFrame.rename(df, names)
  end

@spec row_to_names(Explorer.DataFrame.t(), integer()) :: Explorer.DataFrame.t()
  def row_to_names(df, row_n) do
    new_names = df
    |> Explorer.DataFrame.slice(row_n, 1)
    |> Explorer.DataFrame.to_map()
    |> Map.values()

    Explorer.DataFrame.rename(df, new_names)
  end
end
