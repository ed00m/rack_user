module RackUserCookbook
  # Helpers for the providers
  module Helpers
    def fetch_url(url)
      require 'net/http'
      Net::HTTP.get(URI.parse(url))
    end
  end
end
