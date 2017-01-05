module GW2
  class API
    module Dailies
      # gets today's dailies
      def dailies
        get_response('/v2/achievements/daily')
      end

      # gets tomorrow's dailies
      def dailies_tomorrow
        get_response('/v2/achievements/daily/tomorrow')
      end
    end
  end
end
