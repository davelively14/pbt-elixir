defmodule BiggestTest do
  use ExUnit.Case
  use PropCheck

  ##############
  # Properties #
  ##############

  property "finds largest element" do
    forall list <- list_type() do
      biggest(list) == list |> Enum.sort |> List.last
    end
  end

  ###########
  # Helpers #
  ###########

  def biggest([head | tail]), do: biggest(tail, head)
  def biggest([], max), do: max
  def biggest([head | tail], max) when head > max, do: biggest(tail, head)
  def biggest([_head | tail], max), do: biggest(tail, max)

  ##############
  # Generators #
  ##############

  def list_type do
    Integer |> list |> non_empty
  end
end
