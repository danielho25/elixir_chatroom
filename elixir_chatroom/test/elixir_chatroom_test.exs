defmodule ElixirChatroomTest do
  use ExUnit.Case
  doctest ElixirChatroom

  test "greets the world" do
    assert ElixirChatroom.hello() == :world
  end
end
