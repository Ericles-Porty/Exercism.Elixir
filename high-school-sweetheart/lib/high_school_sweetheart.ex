defmodule HighSchoolSweetheart do
  @moduledoc """
  A module for generating a pair of initials for high school sweethearts.
  """

  @spec first_letter(String.t()) :: String.t()
  def first_letter(name), do: name |> String.trim() |> String.first()

  @spec initial(String.t()) :: String.t()
  def initial(name), do: name |> first_letter |> String.capitalize() |> Kernel.<>(".")

  @spec initials(String.t()) :: String.t()
  def initials(full_name),
    do: full_name |> String.split() |> Enum.map(&initial/1) |> Enum.join(" ")

  @spec pair(String.t(), String.t()) :: String.t()
  def pair(full_name1, full_name2) do
    """
         ******       ******
       **      **   **      **
     **         ** **         **
    **            *            **
    **                         **
    **     #{full_name1 |> initials()}  +  #{full_name2 |> initials()}     **
     **                       **
       **                   **
         **               **
           **           **
             **       **
               **   **
                 ***
                  *
    """
  end
end
