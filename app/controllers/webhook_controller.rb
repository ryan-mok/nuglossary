class WebhookController < ApplicationController
  def webhook
    render status: 401 unless request.headers["Authorization"] == ENV["API_ACCESS_KEY"]
    
    request_object = JSON.parse request.body.read

    intent = request_object["result"]["metadata"]["intentName"]
    parameters = request_object["result"]["parameters"]

    response = ""

    case intent
    when "glossary_lookup"
      nu_lookupTerm = parameters["nu_lookupTerm"]

      dictionary = JSON.parse File.read("app/models/acronyms.json")
      full_term = dictionary["#{nu_lookupTerm}"]

      wikipedia_json = RestClient::Request.execute(
        method: :get,
        url: "https://en.wikipedia.org/w/api.php?action=opensearch&search=#{full_term}&limit=1&format=json"
      )
      wikipedia = JSON.parse wikipedia_json

      p definition = wikipedia.split("[\"")

      response = "#{nu_lookupTerm} is short for #{full_term}."
    end
    
    render json: {
      speech: response
    }
  end
end
