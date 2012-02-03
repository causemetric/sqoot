module Sqoot
  module Provider

    # Retrieve a list of providers base on the following parameters
    #
    # @return [Hashie::Mash]
    def providers(options={})
      options['affiliate_token'] = affiliate_token
      query = options
      response = connection.get do |req|
        req.url "/v1/providers", query
      end

      response.body
    end
  end
end
