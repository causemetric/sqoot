require 'faraday_middleware/response_middleware'

module FaradayMiddleware
  class ParseGzip < ResponseMiddleware
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
      begin
        gz = Zlib::GzipReader.new(sio)
        self.class.mash_class.new(JSON.parse(gz.read()))
      rescue
        begin
          self.class.mash_class.new JSON.parse body
        rescue
          self.class.mash_class.new(:error => body)
        end
      end

    end

  end
end

# deprecated alias
Faraday::Response::ParseGzip = FaradayMiddleware::ParseGzip

Faraday.register_middleware :response, :gzip => FaradayMiddleware::ParseGzip
