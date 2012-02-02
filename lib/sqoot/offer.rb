module Sqoot
  module Offer
    # Retrieve a list of offers.
    #
    def offers
      query = { :affiliate_token => affiliate_token }
      response = connection.get do |req|
        req.url "/v1/offers", query
      end

    end

  end
end
