require "spec_helper"

describe GW2::API::Traits do
  subject{ GW2.client }
  describe ".all_traits", :vcr do
    it "gets all trait IDs" do
      expect(subject.all_traits[2]).to be_an Integer
    end
  end

  describe ".traits_info", :vcr do
    it "gets info for a single trait ID" do
      expect(subject.traits_info(2058)[:name]).to eq("Lingering Light")
    end

    it "gets info for multiple trait IDs" do
      expect(subject.traits_info([2058,1987])[1][:name]).to eq("All's Well That Ends Well")
    end
  end
end
