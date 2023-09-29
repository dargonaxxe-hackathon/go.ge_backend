defmodule GogeCoreTest do
  use ExUnit.Case
  doctest GogeCore

  test "greets the world" do
    assert GogeCore.hello() == :world
  end
end
