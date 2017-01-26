module GW2
  class API
    module Legends
      # gets all legend IDs (strings)
      def all_legends
        get_response("/v2/legends")
      end

      # gets info for legend by ID (string)
      def legend_info(id)
        get_response("/v2/legends#{Utils.format_id(id)}")
      end
    end
  end
end
