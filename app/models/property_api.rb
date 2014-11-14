class PropertyApi
  include HTTParty
  base_uri 'http://api.zoopla.co.uk/'
  key = 'xu9atf63rq2rcc9gmmuqunwh'
  
  def initialize
  end
  
  def listings(postcode)
    @postcode = postcode.downcase.tr(" ", "+")
    # puts self.class.get("api/v1/property_listings.xml?postcode=#{postcode}", @options)
    # self.class.get("api/v1/property_listings.xml?postcode=#{postcode}", @options)
    response = HTTParty.get("http://api.zoopla.co.uk/api/v1/property_listings.json?postcode=#{@postcode}&radius=10&api_key=xu9atf63rq2rcc9gmmuqunwh").parsed_response
    # response = HTTParty.get('https://api.stackexchange.com/2.2/questions?site=stackoverflow')
    # r = response.message
    # puts r
    # puts response.body
    # response['listing'].each do |r|
      # @j = r['status']
      # puts @j
    end

end

# include HTTParty
  # base_uri 'api.stackexchange.com'
# 
  # def initialize(service, page)
    # @options = { query: {site: service, page: page} }
  # end
# 
  # def questions
    # self.class.get("/2.2/questions", @options)
  # end
# 
  # def users
    # self.class.get("/2.2/users", @options)
  # end