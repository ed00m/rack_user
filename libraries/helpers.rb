module RackUserCookbook
  # Helpers for the providers
  module Helpers
    def fetch_url(uri_str)
      require 'net/http'

      url = URI.parse(uri_str) # Make sure you put the trailing slash on!
      r = Net::HTTP.get_response(url)
      if r.code == '301' || r.code == '302'
        # Yes, this only follows a single redirect. That's fine for github, and
        # is a way that we can avoid infinite loops as well.
        r = Net::HTTP.get_response(URI.parse(r['location']))
      end
      r.body
    end
  end
end
