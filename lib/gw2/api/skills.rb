module GW2
  class API
    module Skills
      # gets all skill IDs (integers)
      def all_skills
        get_response("/v2/skills")
      end

      # gets info for skill(s) by ID (integer)
      def skill_info(id)
        get_response("/v2/skills#{Utils.format_id(id)}")
      end
    end
  end
end
