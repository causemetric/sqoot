require "faraday"
require "faraday_middleware"
require "sqoot/version"
require "sqoot/client"

directory = File.expand_path(File.dirname(__FILE__))

module Sqoot

  class << self
    attr_accessor :affiliate_token, :authentication_token, :api_url

    # Configure default credentials easily
    #
    # @yield [Sqoot]
    def configure
      load_defaults
      yield self
      true
    end

    def load_defaults
      self.api_url ||= "http://api.sqoot.com/v1"
    end

  end

end
