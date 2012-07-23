require "faraday"
require "faraday_middleware"
require "sqoot/version"
require "sqoot/client"

directory = File.expand_path(File.dirname(__FILE__))

module Sqoot

  class << self
    attr_accessor :affiliate_token, :authentication_token, :api_url, :api_version

    # Configure default credentials easily
    #
    # @yield [Sqoot]
    def configure
      load_defaults
      yield self
      true
    end

    def load_defaults
      self.api_url ||= "https://api.sqoot.com"
      self.api_version ||= 2
    end

  end

end
