require "faraday"
require "gw2/api"
require "gw2/version"

module GW2
  class << self
    # Alias for GW2::API.new
    def client(api_key=nil)
      GW2::API.new(api_key)
    end

    def method_missing(method_name, *args, &block)
      return super unless respond_to_missing?(method_name)
      GW2::API.send(method_name, *args, &block)
    end

    def respond_to_missing?(method_name, include_private=false)
      GW2::API.respond_to?(method_name, include_private)
    end
  end
end
