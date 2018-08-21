defmodule PbtTest do
  use ExUnit.Case
  use PropCheck

  ##############
  # Properties #
  ##############

  property "description of what the property does" do
    # Binds each generated value of my_type to the variable type
    forall type <- my_type() do
      boolean(type)
    end
  end

  ###########
  # Helpers #
  ###########

  def boolean(_) do
    true
  end

  ##############
  # Generators #
  ##############

  def my_type() do
    # NOTE
    # term() is a generator from PropCheck lib. When expanded via proper_gen, it
    # will produce random results from a variety of types (almost all - pids,
    # for instance, aren't included).
    term()
  end
end

# NOTE
# Try it out:
# $ MIX_ENV="test" iex -S mix
# iex> :proper_types.term()
# iex> :proper_gen.pick(:proper_types.term())
# iex> :proper_gen.pick(:proper_types.number())
# iex> :proper_types.integer
# {:"$type",
#  [
#    env: {:inf, :inf},
#    generator: {:typed, #Function<6.26446982/2 in :proper_types.integer/2>},
#    is_instance: {:typed, #Function<7.26446982/2 in :proper_types.integer/2>},
#    shrinkers: [#Function<8.26446982/3 in :proper_types.integer/2>],
#    kind: :basic
#  ]}
