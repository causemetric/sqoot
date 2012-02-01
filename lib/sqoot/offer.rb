module Sqoot
  module Offer
    # Retrieve a list of offers.
    #
    def offers
      query = { :affiliate_token => affiliate_token }
      response = connection.get do |req|
        req.url "/v1/offers", query
      end

      sio = StringIO.new(response.body)
      gz = Zlib::GzipReader.new(sio)
      # TODO: This returns a string object that needs to be converted
      # into Hashie::Mash
      gz.read()

    end

  end
end
