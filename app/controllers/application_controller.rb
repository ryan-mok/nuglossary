class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def index
    render html: 
      "<iframe
        width='350'
        height='430'
        src='https://console.dialogflow.com/api-client/demo/embedded/nuglossary'>
      </iframe>"
  end
end
