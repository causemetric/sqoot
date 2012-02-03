# Sqoot

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

    sqoot.offers
    #=> returns a list of offers

    sqoot.offers(:location => '123456')

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
