class WebhookController < ApplicationController
  def webhook
    render status: 401 unless request.headers["Authorization"] == ENV["API_ACCESS_KEY"]
    
    request_object = JSON.parse request.body.read
    term = request_object["result"]["parameters"]["nu_lookup"]

    render json: {
      speech: "The term you gave me is #{term}"
    }
  end
end
