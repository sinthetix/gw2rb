require "spec_helper"

describe GW2::API::Utils do
  subject{GW2::API::Utils}
  describe "format_id" do
    it "does nothing with an unsupported or empty value" do
      expect(subject.format_id(nil)).to eq("")
      expect(subject.format_id({})).to eq("")
      expect(subject.format_id([])).to eq("")
    end

    it "returns the single id when given" do
      expect(subject.format_id(1)).to eq("/1")
      expect(subject.format_id("1")).to eq("/1")
    end

    it "returns the multiple id format when given a collection" do
      expect(subject.format_id([1, 2, 3])).to eq("?ids=1,2,3")
      expect(subject.format_id("1, 2, 3")).to eq("?ids=1,2,3")
      expect(subject.format_id(["1", "2", "3"])).to eq("?ids=1,2,3")
    end
  end
end
