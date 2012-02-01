# encoding: utf-8
require "spec_helper"

describe Sqoot do

  let(:client) { Sqoot::Client.new }

  it "should configure with affiliate_token or authentication_token" do
    client.affiliate_token == 'affiliate_token'
  end

  it "should configure with authentication_token" do
    client.authentication_token == 'authentication_token'
  end

  it "should use HTTP API endpoint" do
    client.api_url.should == "http://api.sqoot.com"
  end

end
