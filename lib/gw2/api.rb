require "gw2/api/achievements"
require "gw2/api/dailies"
require "gw2/api/professions"
require "gw2/api/specializations"
require "gw2/utils"

module GW2
  class API
    include GW2::API::Achievements
    include GW2::API::Dailies
    include GW2::API::Professions
    include GW2::API::Specializations
    include GW2::Utils

    attr_reader :api_key

    def initialize(api_key=nil)
      @api_key = api_key
    end

    def get_response(endpoint)
      response = get(endpoint)
      case response.status
      when 200
        Utils.symbolize_keys(JSON.parse(response.body))
      when 403
        if authenticated?
          raise "403 Error: Authorization failed. Verify the API key has correct access."
        else
          raise "403 Error: Please initialize the GW2 client with a proper API key."
       end
      else
        raise "GW2 API returned a #{response.status} error."
      end
    end

    private

    def authenticated?
      !!api_key
    end

    def conn
      @conn ||= Faraday.new(url: base_url) do |faraday|
        faraday.request  :url_encoded
        faraday.adapter  Faraday.default_adapter
      end
    end

    def get(url)
      conn.get do |req|
        req.url url
        req.headers["Content-Type"] = "application/json; charset=utf-8"
        req.headers["Authorization"] = "Bearer #{api_key}" if authenticated?
      end
    end

    def base_url
      "https://api.guildwars2.com"
    end
  end
end
