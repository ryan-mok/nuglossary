class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def index
    render html: "<iframe width=\"90%\" height=\"90%\" src=\"https://console.dialogflow.com/api-client/demo/embedded/nuglossary\"></iframe>".html_safe
  end
end
