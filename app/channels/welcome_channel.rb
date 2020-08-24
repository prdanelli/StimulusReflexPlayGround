class WelcomeChannel < ApplicationCable::Channel
  def subscribed
    stream_from "WelcomeChannel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
