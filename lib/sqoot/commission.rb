module Sqoot
  module Commission

    # Retrieve information of commissions based on the following parameters
    #
    # @param [String] :to Start date
    # @param [String] :from End date
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
