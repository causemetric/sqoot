# encoding: utf-8
require "spec_helper"

describe Sqoot::Deal do
  let(:client) { Sqoot::Client.new }

  it "should return mash list of deals without passing any parameters", :vcr do
    client.deals.equal? Hashie::Mash
  end

  it "should return mash list of deals given location parameter", :vcr do
    client.deals(:location => "444 Castro St. Mountain View").equal? Hashie::Mash
  end

  it "should return per_page result passing per_page parameter", :vcr do
    client.deals(:per_page => 3).per_page == 3
  end

end
