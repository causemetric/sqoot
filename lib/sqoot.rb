require "faraday"
require "faraday_middleware"
require "sqoot/version"
require "sqoot/client"

directory = File.expand_path(File.dirname(__FILE__))

module Sqoot

  class << self
    attr_accessor :affiliate_token, :authentication_token

    # Configure default credentials easily
    #
    # @yield [affiliate_key, authentication_token]
    def configure
      yield self
      true
    end

  end

end
