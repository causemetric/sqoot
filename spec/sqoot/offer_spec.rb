# encoding: utf-8
require "spec_helper"

describe Sqoot::Offer do
  let(:client) { Sqoot::Client.new }

  it "should return Hashie::Mash list of offers without passing any parameters" do
    VCR.use_cassette "offers/all_json" do
      client.offers.equal? Hashie::Mash
    end
  end

  it "should return a total count of offers" do
    VCR.use_cassette "offers/all_json" do
      client.offers.total.should == 1335
    end
  end

  it "should return an array of offers" do
    VCR.use_cassette "offers/all_json" do
      client.offers.offers.equal? Array
    end
  end

  it "should return a list of offers given a :location parameter" do
    VCR.use_cassette "offers/per_location" do
      offers_on_location = client.offers(:location => '12345')
      offers_on_location.equal? Hashie::Mash
      offers_on_location.total.should == 1
      offers_on_location.offers.equal? Array
    end
  end

end
