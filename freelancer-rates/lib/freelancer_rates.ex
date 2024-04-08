defmodule FreelancerRates do

  @daily_time 8.0
  @month_billable_days 22

  def daily_rate(hourly_rate) do
    hourly_rate * @daily_time
  end

  def apply_discount(before_discount, discount) do
    before_discount  * (1 - (discount / 100))
  end

  def monthly_rate(hourly_rate, discount) do
    ceil(apply_discount(daily_rate(hourly_rate) * @month_billable_days, discount))
  end

  def days_in_budget(budget, hourly_rate, discount) do
      daily_gains = daily_rate(hourly_rate)
      discounted_daily_gains = apply_discount(daily_gains, discount)
      (budget / discounted_daily_gains) |> Float.floor(1)
  end
end
