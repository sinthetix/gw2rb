module GW2
  class API
    module Traits
      # gets all trait IDs (integers)
      def all_traits
        get_response("/v2/traits")
      end

      # gets info for trait(s) by ID (integer)
      def trait_info(id)
        get_response("/v2/traits#{Utils.format_id(id)}")
      end
    end
  end
end
