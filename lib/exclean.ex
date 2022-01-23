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

  def row_to_names(df, row_n) when is_integer(row_n) do
    new_names = df
    |> Explorer.DataFrame.slice(row_n, 1)
    |> Explorer.DataFrame.to_map()
    |> Map.values()

    Explorer.DataFrame.rename(df, new_names)
  end

  def row_to_names(df, "first") do
    row_to_names(df, 0)
  end



  defp convert_empty(x) do
    case x do
      {""} -> :nil
      _ -> x
    end
  end

  def empty_to_nil(df, column_name) when is_atom(column_name) do
    clean_column =
      df
      |> Explorer.DataFrame.pull(column_name)
      |> Explorer.Series.to_list()
      |> Enum.map(&convert_empty/1)
      |> Explorer.Series.from_list()

      df
      |> Explorer.DataFrame.mutate(%{column_name => clean_column})
  end



  #def convert_to_date() do
  #  IO.inspect("Not implemented yet")
  #end

  #def remove_empty_columns(df) do
  #  IO.inspect("Not implemented yet")
  #end

  #def remove_empty_rows() do
  #  IO.inspect("Not implemented yet")
  #end

end
