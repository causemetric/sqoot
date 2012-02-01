# encoding: utf-8
require "spec_helper"

describe Sqoot::Client do

  it "should return Faraday::Connection" do
    params = {}
    client_with_faraday_connection = Sqoot::Client.new
    client_with_faraday_connection.connection.equal? Faraday::Connection
  end

end
