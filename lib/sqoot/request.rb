module Sqoot
  module Request

    attr_reader :last_response

    def get(path, options)
      request(:get, path, convert_params(path, options))
    end

    def convert_params(path, data={})
      auth_endpoints = ['commissions', 'clicks']
      private_beta_endpoints = ['deals', 'merchants']

      if auth_endpoints.include? path.split('/')[2]
        data['authentication_token'] = authentication_token
      else
        # TODO:
        # Temporary provisioned filter until
        # v2 is publicly available
        if private_beta_endpoints.include? path.split('/')[2]
          data['api_key'] = affiliate_token
        else
          data['affiliate_token'] = affiliate_token
        end
      end

      data

    end

    def request(method, path, options)
      response = connection.send(method) do |request|
        request.options[:timeout] = 10
        case method
        when :delete, :get
          request.url(path, options)
        when :post, :put
          request.path = path
          request.body = MultiJson.encode(options) unless options.empty?
        end
      end

      @last_response = response
      response.body
    end

  end
end
