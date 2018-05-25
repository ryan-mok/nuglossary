class WebhookController < ApplicationController
  def webhook
    render status: 401 unless request.headers["Authorization"] == ENV["API_ACCESS_KEY"]
    
    request_object = JSON.parse request.body.read

    intent = request_object.[result].metadata.intentName
    parameters = request_object.result.parameters

    response = ""

    case intent
    when "glossary_lookup"
      nu_lookupTerm = parameters.nu_lookupTerm
      response = "#{nu_lookupTerm} is short for #{"some new term"}."
    end
    
    render json: {
      speech: response
    }
  end
end
