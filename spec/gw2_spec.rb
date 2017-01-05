require "spec_helper"
require "gw2"

describe GW2 do
  describe ".client" do
    it "creates a new GW2::API client" do
      expect(GW2.client).to be_kind_of GW2::API
    end
  end
end
