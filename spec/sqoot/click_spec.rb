# encoding: utf-8
require "spec_helper"

describe Sqoot::Click do
  let(:client) { Sqoot::Client.new }

  it "should return mash list of clicks without passing any parameters", :vcr do
    client.clicks.equal? Hashie::Mash
  end

  it "should return an array of clicks", :vcr do
    client.clicks.categories.equal? Array
  end

end
