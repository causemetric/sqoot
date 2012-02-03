# encoding: utf-8
require "spec_helper"

describe Sqoot::Commission do
  let(:client) { Sqoot::Client.new }

  it "should return mash list of commissions without passing any parameters", :vcr do
    client.commissions.equal? Hashie::Mash
  end

  it "should return an array of commissions", :vcr do
    client.commissions.categories.equal? Array
  end

end
