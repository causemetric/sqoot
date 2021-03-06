require "forwardable"
require "sqoot/merchant"
require "sqoot/category"
require "sqoot/provider"
require "sqoot/commission"
require "sqoot/click"
require "sqoot/deal"
require "sqoot/request"
require "sqoot/faraday_middleware/parse_gzip"

module Sqoot
  class Client
    extend Forwardable

    include Merchant
    include Category
    include Provider
    include Commission
    include Click
    include Request
    include Deal

    attr_reader :affiliate_token, :authentication_token, :api_url, :api_version

    def initialize(options={})
      @affiliate_token        = options[:affiliate_token] || Sqoot.affiliate_token
      @authentication_token   = options[:authentication_token] || Sqoot.authentication_token
      @api_url                = options[:api_url] || Sqoot.api_url
      @api_version            = options[:api_version] || Sqoot.api_version
    end

    # Raw HTTP connection with Faraday::Connection
    #
    # @return [Faraday::Connection]
    def connection
      params = {}
      @connection ||= Faraday.new(:url => api_url, :params => params, :headers => default_headers) do |conn|
        conn.response :gzip
        conn.response :follow_redirects

        conn.adapter Faraday.default_adapter
      end
    end

    private

    def default_headers
      {
        :authorization => @authentication_token,
        :accept => '*/*',
        :accept_encoding => 'gzip',
        :user_agent => 'Ruby gem'
      }
    end

  end
end
