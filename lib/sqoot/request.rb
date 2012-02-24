module Sqoot
  module Request

    def get(path, options)
      request(:get, path, convert_params(path, options))
    end

    def convert_params(path, data={})
      auth_endpoints = ['commissions', 'clicks']

      if auth_endpoints.include? path.split('/')[2]
        data['authentication_token'] = authentication_token
      else
        data['affiliate_token'] = affiliate_token
      end

      data

    end

    def request(method, path, options)
      response = connection.send(method) do |request|
        case method
        when :delete, :get
          request.url(path, options)
        when :post, :put
          request.path = path
          request.body = MultiJson.encode(options) unless options.empty?
        end
      end

      response.body
    end

  end
end
