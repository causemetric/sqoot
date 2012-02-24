require "forwardable"
require "sqoot/offer"
require "sqoot/category"
require "sqoot/provider"
require "sqoot/commission"
require "sqoot/click"
require "sqoot/request"
require "sqoot/response/parse_gzip"

module Sqoot
  class Client
    extend Forwardable

    include Offer
    include Category
    include Provider
    include Commission
    include Click
    include Request

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
      @connection = Faraday.new(:url => api_url, :params => params, :headers => default_headers) do |builder|
        builder.use Faraday::Response::ParseGzip
        builder.adapter Faraday.default_adapter
      end
    end

    private

    def default_headers
      headers = {
        :authorization => @authentication_token,
        :accept => '*/*',
        :accept_encoding => 'gzip',
        :user_agent => 'Ruby gem'
      }
    end

  end
end
