class WelcomeController < ApplicationController
  def index
    ActionCable.server.broadcast("WelcomeChannel", Time.now)
  end
end
