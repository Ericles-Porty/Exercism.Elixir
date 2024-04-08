defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(r1 :: rational, r2 :: rational) :: rational
  def add({num1, den1}, {num2, den2}),
    do:
      {num1 * den2 + num2 * den1, den1 * den2}
      |> reduce()

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(r1 :: rational, r2 :: rational) :: rational
  def subtract({num1, den1}, {num2, den2}),
    do:
      {num1 * den2 - num2 * den1, den1 * den2}
      |> reduce()

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(r1 :: rational, r2 :: rational) :: rational
  def multiply({num1, den1}, {num2, den2}),
    do:
      {num1 * num2, den1 * den2}
      |> reduce()

  @doc false
  @spec multiply_without_reduce(r1 :: rational, r2 :: rational) :: rational
  defp multiply_without_reduce({num1, den1}, {num2, den2}) do
    {num1 * num2, den1 * den2}
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(r1 :: rational, r2 :: rational) :: rational
  def divide_by({num1, den1}, {num2, den2}),
    do:
      {num1 * den2, num2 * den1}
      |> reduce()

  @doc """
  abs value of a rational number
  """
  @spec abs(r :: rational) :: rational
  def abs({num, den}) do
    cond do
      num < 0 && den < 0 -> {-num, -den}
      num < 0 -> {-num, den}
      den < 0 -> {num, -den}
      true -> {num, den}
    end
    |> reduce()
  end

  @doc false
  @spec abs_without_reduce(a :: rational) :: rational
  defp abs_without_reduce({a1, a2}) do
    cond do
      a1 < 0 && a2 < 0 -> {a1 * -1, a2 * -1}
      a1 < 0 -> {a1 * -1, a2}
      a2 < 0 -> {a1, a2 * -1}
      true -> {a1, a2}
    end
  end

  @doc false
  @spec invert_order(a :: rational) :: rational
  defp invert_order({a1, a2}), do: {a2, a1}

  @doc false
  @spec pow_rational_rec(r :: rational, original_r :: rational, n :: integer) :: rational
  defp pow_rational_rec(r, original_r, n) do
    cond do
      n == 1 -> r
      n == 0 -> {1, 1}
      n > 1 -> multiply_without_reduce(r, original_r) |> pow_rational_rec(original_r, n - 1)
      n < 0 -> pow_rational_rec(r, original_r, -n) |> invert_order()
      true -> r
    end
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(r :: rational, n :: integer) :: rational
  def pow_rational(r, n),
    do: pow_rational_rec(r, r, n) |> reduce()

  @doc """
  Exponentiation of a real number by a rational number
  Formula used: x^(a/b) = (x^a)^(1/b)
  """
  @spec pow_real(x :: integer, r :: rational) :: float
  def pow_real(x, {r1, r2}) do
    {p1, p2} = pow_rational({x, 1}, r1)
    (p1 / p2) ** (1 / r2)
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(r :: rational) :: rational
  def reduce({num, den}) when den < 0, do: reduce({-num, -den})

  def reduce({num, den}) do
    gcd = gcd({num, den})

    {num / gcd, den / gcd}
  end

  @doc false
  @spec gcd_rec(a :: rational) :: integer
  defp gcd_rec({a1, 0}), do: a1
  defp gcd_rec({a1, a2}), do: gcd_rec({a2, rem(a1, a2)})

  @doc false
  @spec gcd(a :: rational) :: integer
  defp gcd(a), do: gcd_rec(abs_without_reduce(a))
end
