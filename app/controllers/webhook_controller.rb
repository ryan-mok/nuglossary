class WebhookController < ApplicationController
  def webhook
    render json: {
      speech: "This is the webhook returning."
    }
  end
end
