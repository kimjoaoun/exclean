defmodule Cleanex do
  @moduledoc """
  Documentation for `Cleanex`.
  """

@doc """
Clean Names

## Examples

    iex> df = Explorer.DataFrame.from_map(%{josé: ["Valim"]})
    iex> Cleanex.clean_names(df, "snake")
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
end
