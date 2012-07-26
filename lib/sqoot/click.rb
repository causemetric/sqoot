module Sqoot
  module Click

    # Retrieve a list of clicks based on the following parameters
    #
    # @param [String] :to Start date
    # @param [String] :from End date
    #
    # @return [Hashie::Mash]
    def clicks(options={})
      clicks = get('/v1/clicks', options)

      clicks.clicks if clicks.clicks?
    end
  end
end
