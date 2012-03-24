# Sqoot [![Build Status](https://secure.travis-ci.org/causemetric/sqoot.png)](http://travis-ci.org/causemetric/sqoot)

Wrapper for [Sqoot](http://www.sqoot.com) [API](http://www.sqoot.com/docs/api). Highly inspired by [Gowalla](https://github.com/pengwynn/gowalla) gem.
Built using [Faraday](https://github.com/technoweenie/faraday) and [Faraday Middleware](https://github.com/pengwynn/faraday_middleware).

To get the list of available parameters kindly check out [API](http://www.sqoot.com/docs/search)

## Installation

Add this line to your application's Gemfile:

    gem 'sqoot'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sqoot

## Usage

    Sqoot.configure do |config|
      config.affiliate_token = "YOUR AFFILIATE TOKEN"
      config.authentication_token = "YOUR AUTHENTICATION TOKEN"
    end

    sqoot = Sqoot::Client.new

    # http://api.sqoot.com/v1/offers?affiliate_token=yadayada
    sqoot.offers
    #=> returns a list of offers

    # http://api.sqoot.com/v1/offers?affiliate_token=yadayada&location=Chicago
    sqoot.offers(:location => 'Chicago')

    # http://api.sqoot.com/v1/offers?affiliate_token=yadayada&location=Chicago&per_page=10
    sqoot.offers(:location => 'Chicago', :per_page => 10)

    # http://api.sqoot.com/v1/offers?affiliate_token=yadayada&categories=health-beauty&location=&page=2
    sqoot.offers(:location => 'Chicago', :per_page => 10, :categories => 'health-beauty', :page => 2)

    # http://api.sqoot.com/v1/offers?affiliate_token=yadayada&order=commission&per_page=250&price_at_least=10
    sqoot.offers(:price_at_least => 10, :order => commission)

    # http://api.sqoot.com/v1/providers?affiliate_token=yadayada
    sqoot.providers

    # http://api.sqoot.com/v1/commissions?authentication_token=tokenawesome
    sqoot.commissions
    # => returns current month commissions

    sqoot.commissions(:to => '2012-01-01', :from => '2012-01-20')
    # => returns commissions using date_range :to & :from

    # http://api.sqoot.com/v1/clicks?authentication_token=tokenawesome
    sqoot.clicks
    # => returns real-time clicks from the event request limit of 1000

    sqoot.clicks(:to => '2012-01-01', :from => '2012-01-20')
    # => returns clicks using date_range :to & :from


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
