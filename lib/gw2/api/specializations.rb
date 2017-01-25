module GW2
  class API
    module Specializations
      # gets all specialization IDs (integers)
      def all_specializations
        get_response("/v2/specializations")
      end

      # gets info for specialization by ID (integer)
      def specialization_info(id)
        get_response("/v2/specializations#{Utils.format_id(id)}")
      end
    end
  end
end
