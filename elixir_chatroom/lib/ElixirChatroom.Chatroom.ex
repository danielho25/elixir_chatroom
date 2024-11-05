defmodule ElixirChatroom.Chatroom do
  def start_chat_room do
    spawn(fn -> chat_room_loop([]) end)
  end

  defp chat_room_loop(messages) do
    receive do
      {:message, sender, content} ->
        # Pattern matching with the = sign
        new_messages = [{sender, content} | messages]
        IO.puts("#{sender} says: #{content}")
        chat_room_loop(new_messages)

      {:get_messages, requester} ->
        # Return the message history to the requester
        send(requester, {:message_history, messages})
        chat_room_loop(messages)
    end
  end
end
