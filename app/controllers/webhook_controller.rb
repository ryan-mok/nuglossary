class WebhookController < ApplicationController
  def webhook
    client = ApiAiRuby::Client.new(
      :client_access_token => ENV['API_ACCESS_TOKEN']
    )

    response = client.text_request "hello!"

    p response

    render json: response
  end
end
