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
      get('/v1/offers', options)
    end

  end
end
