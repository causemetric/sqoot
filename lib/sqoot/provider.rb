module Sqoot
  module Provider

    # Retrieve a list of providers base on the following parameters
    #
    # @return [Hashie::Mash]
    def providers(options={})
      get('/v1/providers', options)
    end
  end
end
