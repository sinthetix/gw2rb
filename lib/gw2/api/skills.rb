module GW2
  class API
    module Skills
      # gets all specialization IDs (integers)
      def all_skills
        get_response("/v2/skills")
      end

      # gets info for specialization by ID (integer)
      def skill_info(id)
        get_response("/v2/skills#{Utils.format_id(id)}")
      end
    end
  end
end
