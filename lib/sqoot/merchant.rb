module Sqoot
  module Merchant

    # Retrieve a list of merchants base on the following parameters
    #
    # @param [String] id (The merchant's ID, Use the Sqoot ID or ID for any supported namespace. Must supply namespace if we don't use Sqoot)
    # @param [String] namespace (One of the supported namespaces. Factual, Foursquare, Facebook, Google, CitySearch, Yelp.)
    def merchants(options={})
      get('/v2/merchants', options)
    end
  end
end
