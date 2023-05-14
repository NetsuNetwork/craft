defmodule CraftTest do
  use ExUnit.Case
  doctest Craft

  test "greets the world" do
    assert Craft.hello() == :world
  end
end
