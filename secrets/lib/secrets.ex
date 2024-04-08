defmodule Secrets do
  import Bitwise
  def secret_add(secret) do
    fn number_to_add -> number_to_add + secret end
  end

  def secret_subtract(secret) do
    fn number_to_subtract -> number_to_subtract - secret  end
  end

  def secret_multiply(secret) do
    fn number_to_multiply -> number_to_multiply * secret end
  end

  def secret_divide(secret) do
    fn number_to_divide -> div(number_to_divide, secret) end
  end

  def secret_and(secret) do
    fn number_to_and -> band(number_to_and, secret) end
  end

  def secret_xor(secret) do
    fn number_to_xor -> bxor(number_to_xor, secret) end
  end

  def secret_combine(secret_function1, secret_function2) do
    fn combined -> secret_function2.(secret_function1.(combined)) end
  end
end
