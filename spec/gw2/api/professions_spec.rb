require "spec_helper"

describe GW2::API::Professions do
  subject{ GW2.client }
  describe ".all_professions", :vcr do
    it "gets all achievement IDs" do
      expect(subject.all_professions[8]).to be_a String
    end
  end

  describe ".profession_info", :vcr do
    it "gets info for a single profession ID" do
      expect(subject.profession_info("Mesmer")[:weapons][:Focus][:skills]).to eq([
        {
          :id => 10186,
          :slot => "Weapon_4"
        },
        {
          :id => 10282,
          :slot => "Weapon_5"
        }
      ])
    end

    it "gets info for multiple profession IDs" do
      expect(subject.profession_info("Thief, Mesmer")[1][:name]).to eq("Mesmer")
    end
  end
end
