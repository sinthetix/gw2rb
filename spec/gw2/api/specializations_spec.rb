require "spec_helper"

describe GW2::API::Specializations do
  subject{ GW2.client }
  describe ".all_specializations", :vcr do
    it "gets all specializations IDs" do
      expect(subject.all_specializations[2]).to be_an Integer
    end
  end

  describe ".specialization_info", :vcr do
    it "gets info for a single specialization ID" do
      expect(subject.specialization_info(1)[:name]).to eq("Dueling")
    end

    it "gets info for multiple specialization IDs" do
      expect(subject.specialization_info([1,2])[1][:name]).to eq("Death Magic")
    end
  end
end
