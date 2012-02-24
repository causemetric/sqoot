module Sqoot
  module Category

    # Retrieve a list of categories base on the following parameters
    #
    # @return [Hashie::Mash] category list
    def categories(options={})
      get('/v1/categories', options)
      # options['affiliate_token'] = affiliate_token
      # query = options
      # response = connection.get do |req|
      #   req.url "/v1/categories", query
      # end

      # response.body
    end
  end
end
