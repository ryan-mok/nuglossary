class WebhookController < ApplicationController
  def webhook
    client = ApiAiRuby::Client.new(
      :client_access_token => ENV['API_ACCESS_TOKEN']
    )

    p response = client.text_request "hello!"

    render json: response
  end
end
