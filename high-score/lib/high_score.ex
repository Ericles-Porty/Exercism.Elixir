defmodule HighScore do
  @type score_map :: {String.t(), integer}

  @initial_score 0

  @spec new() :: map
  def new(), do: %{}

  @spec add_player(score_map, String.t(), integer) :: score_map
  def add_player(scores, name, score \\ @initial_score), do: Map.put(scores, name, score)

  @spec remove_player(score_map, String.t()) :: score_map
  def remove_player(scores, name), do: Map.delete(scores, name)

  @spec reset_score(score_map, String.t()) :: score_map
  def reset_score(scores, name), do: Map.put(scores, name, @initial_score)

  @spec update_score(score_map, String.t(), integer) :: score_map
  def update_score(scores, name, score),
    do: Map.update(scores, name, score, fn current_score -> current_score + score end)

  @spec get_players(score_map) :: list(String.t())
  def get_players(scores), do: Map.keys(scores)
end
