module Sqoot
  module Category

    # Retrieve a list of categories base on the following parameters
    #
    # @return [Hashie::Mash] category list
    def categories(options={})
      get('/v2/categories', options)
    end
  end
end
