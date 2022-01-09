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

end
