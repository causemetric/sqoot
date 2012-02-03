module Sqoot
  module Commission

    # Retrieve information of commissions based on the following parameters
    #
    # @return [Hashie::Mash]
    def commissions(options={})
      options['authentication_token'] = authentication_token
      query = options
      response = connection.get do |req|
        req.url "/v1/commissions", query
      end

      response.body
    end

  end
end
