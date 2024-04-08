defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search({}, _), do: :not_found

  def search(numbers, key) do
    Tuple.to_list(numbers) |> search_rec(key, 0, tuple_size(numbers))
  end
  
  @doc false
  @spec search_rec([integer], integer, non_neg_integer, non_neg_integer) :: {:ok, non_neg_integer} | :not_found
  defp search_rec(_, _, index, index), do: :not_found

  defp search_rec(numbers, key, start_index, end_index) do
    middle_index = floor((end_index + start_index) / 2)
    element = Enum.at(numbers, middle_index)

    cond do
      key == element -> {:ok, middle_index}
      key > element -> search_rec(numbers, key, middle_index + 1, end_index)
      key < element -> search_rec(numbers, key, start_index, middle_index)
    end
  end
end
