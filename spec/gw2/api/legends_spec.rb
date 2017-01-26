require "spec_helper"

describe GW2::API::Legends do
  subject{ GW2.client }
  describe ".all_legends", :vcr do
    it "gets all legend IDs" do
      expect(subject.all_legends[4]).to be_a String
    end
  end

  describe ".legend_info", :vcr do
    it "gets info for a single legend ID" do
      expect(subject.legend_info("Legend2")[:elite]).to be 28406
    end

    it "gets info for multiple legend IDs" do
      expect(subject.legend_info("Legend2, Legend4")[1][:elite]).to be 28287
    end
  end
end
