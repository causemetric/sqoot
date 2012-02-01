# encoding: utf-8
require "spec_helper"

describe Sqoot::Offer do
  let(:client) { Sqoot::Client.new }

  it "should return Hashie::Mash list of offers without passing any parameters" do
    VCR.use_cassette "offers/all" do
      client.offers.equal? Hashie::Mash
    end
  end

end
