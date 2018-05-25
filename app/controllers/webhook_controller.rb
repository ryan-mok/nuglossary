class WebhookController < ApplicationController
  def webhook
    return json {
      speech: "This is the webhook returning."
    }
  end
end
