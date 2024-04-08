defmodule LanguageList do
  @spec new() :: list
  def new(), do: []

  @spec add(list :: list, language :: String) :: list
  def add(list, language), do: [language | list]

  @spec remove(list :: list) :: list
  def remove([ _ | tail]), do: tail

  @spec first(list :: list) :: String
  def first([first | _ ]), do: first

  @spec count(list :: list) :: integer
  def count([]), do: 0
  def count([ _ | tail]), do: 1 + count(tail)
  
  @spec functional_list?(list :: list) :: boolean
  def functional_list?([]), do: false
  def functional_list?(["Elixir" | _]), do: true
  def functional_list?([ _ | tail]), do: functional_list?(tail)
end
