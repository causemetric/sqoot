require "faraday"

module Faraday
  class Response::ParseGzip < Response::Middleware
    dependency 'net_http'

    def parse(body)
      sio = StringIO.new(body)
      gz = Zlib::GzipReader.new(sio)
      gz.read()
    end

  end
end
