require "forwardable"

module Sqoot
  class Client
    extend Forwardable

    attr_reader :affiliate_token, :authentication_token

    def initialize(options={})
      @affiliate_token        = options[:affiliate_token] || Sqoot.affiliate_token
      @authentication_token   = options[:authentication_token] || Sqoot.authentication_token
    end

    # Provides the URL for accessing the API
    #
    # @return [String]
    def api_url
      "http://api.sqoot.com"
    end

    # Raw HTTP connection with Faraday::Connection
    #
    # @return [Faraday::Connection]
    def connection
      params = {}
      @connection ||= Faraday.new(:url => api_url, :params => params, :headers => default_headers) do |builder|
        builder.use FaradayMiddleware::Mashify
        builder.use FaradayMiddleware::ParseJson, :content_type => /\bjson$/
        builder.adapter Faraday.default_adapter
      end
    end

    private

    def default_headers
      headers = {
        :accept => 'application/json',
        :user_agent => 'Ruby gem',
        :authorization => @authentication_token
      }
    end

  end
end
