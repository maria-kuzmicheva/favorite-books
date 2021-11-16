require 'rails_helper'

RSpec.describe "Root", type: :request do
  describe "GET/" do
    it "renders search template"  do
      # this will perform a GET request to the /health/index route
        get "/"
      
      # 'response' is a special object which contain HTTP response received after a request is sent
      # response.body is the body of the HTTP response, which here contain a JSON string
      #expect(.search).to eq(search_path)
      
      # we can also check the http status of the response
      expect(response.status).to eq(200)
      #expect(response).to have_http_status(:ok)
    end
  end
end