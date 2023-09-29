defmodule GoGe.CoreTest do
  use ExUnit.Case
  doctest GoGe.Core

  test "greets the world" do
    assert GoGe.Core.hello() == :world
  end
end
