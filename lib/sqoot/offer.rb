module Sqoot
  module Offer

    # Retrieve a list of offers based on the following parameters
    #
    # @param [String] location (What geography do you want deals from? It can be anything: a city, zip code, address, intersection or even a latitude/longitude)
    # @param [String] categories (You can specify just one (e.g., restaurants), or whole bunch by separating their slugs with commas (e.g., "restaurants,jewish")
    # @param [Integer] per_page Number of results to be displayed
    #
    # @return [Hashie::Mash] offers list
    def offers(options={})
      options['affiliate_token'] = affiliate_token
      query = options
      response = connection.get do |req|
        req.url "/v1/offers", query
      end

      response.body
    end

  end
end
