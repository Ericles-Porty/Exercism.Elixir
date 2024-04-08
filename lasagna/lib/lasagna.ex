defmodule Lasagna do
  def expected_minutes_in_oven() do
    40
  end
  
  def remaining_minutes_in_oven(minutes_been) do
    expected_minutes_in_oven() - minutes_been
  end
  
  def preparation_time_in_minutes(n_layers) do
    n_layers * 2
  end
  
  def total_time_in_minutes(n_layers, minutes_been) do
    preparation_time_in_minutes(n_layers) + minutes_been
  end

  def alarm() do 
    "Ding!"  
  end

end
