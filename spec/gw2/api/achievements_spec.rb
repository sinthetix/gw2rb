require "spec_helper"

describe GW2::API::Achievements do
  subject{GW2.client}
  describe ".all_achievements", :vcr do
    it "gets all achievement IDs" do
        expect(subject.all_achievements).to be_an Array
    end
  end

  describe ".achievements_info", :vcr do
    it "gets info for an achievement ID" do
      expect(subject.achievements_info(1)).to be_a Hash
    end

    it "gets info for multiple achievement IDs" do
      expect(subject.achievements_info([1,2])).to be_an Array
    end
  end

  describe ".achievements_categories", :vcr do
    it "gets all achievement category IDs when no ID provided" do
      expect(subject.achievements_categories).to be_an Array
    end

    it "gets category information when provided ID" do
      expect(subject.achievements_categories(1)).to be_a Hash
    end

    it "gets category information when provided multiple IDs" do
      expect(subject.achievements_categories([1,2])).to be_an Array
    end
  end

  describe ".achievements_groups", :vcr do
    it "gets all achievement group IDs when no ID provided" do
      expect(subject.achievements_groups).to be_an Array
    end

    it "gets group information when provided ID" do
      expect(subject.achievements_groups("647D3B02-2302-41F0-88A3-6D88BB6F55CF")).to be_a Hash
    end

    it "gets group information when provided multiple IDs" do
      expect(subject.achievements_groups(["647D3B02-2302-41F0-88A3-6D88BB6F55CF","A4ED8379-5B6B-4ECC-B6E1-70C350C902D2"])).to be_an Array
    end
  end
end
