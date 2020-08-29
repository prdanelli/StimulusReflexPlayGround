class TodosChannel < ApplicationCable::Channel
  def subscribed
    stream_from "TodoChannel"
  end

  def unsubscribed; end
end
