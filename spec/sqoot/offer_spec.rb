# encoding: utf-8
require "spec_helper"

describe Sqoot::Offer do
  let(:client) { Sqoot::Client.new }

  it "should return mash list of offers without passing any parameters", :vcr do
    client.offers.equal? Hashie::Mash
  end

  it "should return a list of offers given a location parameter", :vcr do
    offers_on_location = client.offers(:location => '12345')
    offers_on_location.equal? Hashie::Mash
  end

end
