module Sqoot
  module Click

    # Retrieve a list of clicks based on the following parameters
    #
    # @param [String] :to Start date
    # @param [String] :from End date
    #
    # @return [Hashie::Mash]
    def clicks(options={})
      options['authentication_token'] = authentication_token
      query = options
      response = connection.get do |req|
        req.url "/v1/clicks", query
      end

      response.body
    end
  end
end
