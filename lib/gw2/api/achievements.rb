module GW2
  class API
    module Achievements
      # gets all achievement IDs
      def all_achievements
        get_response("/v2/achievements")
      end

      # gets info for achievement by ID
      def achievements_info(id)
        get_response("/v2/achievements#{Utils.format_id(id)}")
      end

      # gets list of achievement category IDs if no ID provided
      # gets info for achievement category if provided ID
      def achievements_categories(id=nil)
        get_response("/v2/achievements/categories#{Utils.format_id(id)}")
      end

      # gets list of achievement group IDs if no ID provided
      # gets info for achievement group if provided ID
      def achievements_groups(id=nil)
        get_response("/v2/achievements/groups#{Utils.format_id(id)}")
      end
    end
  end
end
