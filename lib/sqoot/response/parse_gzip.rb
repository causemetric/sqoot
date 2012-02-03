require "faraday"

module Faraday
  class Response::ParseGzip < Response::Middleware
    class << self
      attr_accessor :mash_class
    end

    dependency do
      require 'json'
      require 'hashie/mash'
      self.mash_class = ::Hashie::Mash
    end

    def parse(body)
      sio = StringIO.new(body)
      gz = Zlib::GzipReader.new(sio)
      self.class.mash_class.new(JSON.parse(gz.read()))
    end

  end
end
