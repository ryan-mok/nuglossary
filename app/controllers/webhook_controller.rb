class WebhookController < ApplicationController
  def webhook
    render html: "This is the webhook"
  end
end
