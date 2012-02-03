# encoding: utf-8
require "spec_helper"

describe Sqoot::Category do
  let(:client) { Sqoot::Client.new }

  it "should return mash list of categories without passing any parameters", :vcr do
    client.categories.equal? Hashie::Mash
  end

  it "should return an array of categories", :vcr do
    client.categories.categories.equal? Array
  end

end
