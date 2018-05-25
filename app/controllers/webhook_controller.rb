class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def webhook
    render html: "Welcome to webhook"
  end
end