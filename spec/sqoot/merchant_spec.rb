# encoding: utf-8
require "spec_helper"

describe Sqoot::Merchant do
  let(:client) { Sqoot::Client.new }

  it "should return mash list of merchants without passing any parameters", :vcr do
    client.merchants.equal? Hashie::Mash
  end

  it "should return an array of categories", :vcr do
    client.merchants.merchants.equal? Array
  end

end
