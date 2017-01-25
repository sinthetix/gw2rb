require "spec_helper"

describe GW2::API::Skills do
  subject{ GW2.client }
  describe ".all_skills", :vcr do
    it "gets all skill IDs" do
      expect(subject.all_skills[2]).to be_an Integer
    end
  end

  describe ".skill_info", :vcr do
    it "gets info for a single skill ID" do
      expect(subject.skill_info(5697)[:name]).to eq("Fiery Whirl")
    end

    it "gets info for multiple skill IDs" do
      expect(subject.skill_info([5697,5487])[1][:name]).to eq("Frozen Burst")
    end
  end
end
