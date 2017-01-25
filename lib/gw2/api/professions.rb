module GW2
  class API
    module Professions
      # gets all profession IDs (names)
      def all_professions
        get_response("/v2/professions")
      end

      # gets info for profession by ID (name)
      def profession_info(id)
        get_response("/v2/professions#{Utils.format_id(id)}")
      end
    end
  end
end
