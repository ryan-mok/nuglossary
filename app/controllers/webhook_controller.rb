class WebhookController < ApplicationController
  def webhook
    render status: 401 unless request.headers["Authorization"] == ENV["API_ACCESS_KEY"]
    
    render json: {
      speech: "The JSON body is: #{request.body.read}."
    }
  end
end
