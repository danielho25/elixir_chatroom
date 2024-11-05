defmodule ElixirChatroom.Client do
  def send_message(chat_room_pid, sender, content) do
    send(chat_room_pid, {:message, sender, content})
  end

  def get_message_history(chat_room_pid) do
    send(chat_room_pid, {:get_messages, self()})

    receive do
      {:message_history, messages} ->
        IO.puts("Chat history:")
        Enum.each(messages, fn {sender, content} ->
          IO.puts("#{sender}: #{content}")
        end)
    after
      1000 -> IO.puts("No response from chat room.")
    end
  end
end
