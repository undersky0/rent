require 'rails_helper'

RSpec.describe "Properties", :type => :request do
  describe "GET /properties" do
    it "works! (now write some real specs)" do
      get properties_path
      expect(response).to have_http_status(200)
    end
  end
  
  describe "zoopla API" do 
    it 'gets a list of nearby properties' do
      postcode = "CF24+1PL"
      response = HTTParty.get("http://api.zoopla.co.uk/api/v1/property_listings.json?postcode=#{postcode}&radius=10&listing_status=rent&api_key=xu9atf63rq2rcc9gmmuqunwh")
      json = response.parsed_response
      (expect(response.code).to eq(200))
    end
  end
end
