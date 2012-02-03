# encoding: utf-8
require "spec_helper"

describe Sqoot::Provider do
  let(:client) { Sqoot::Client.new }

  it "should return a mash list of providers" do
    client.providers.equal? Hashie::Mash
  end

  it "should return an array of providers" do
    client.providers.providers.equal? Array
  end

end
