require "spec_helper"

describe GW2::API::Achievements do
  subject{GW2.client}
  describe ".all_achievements", :vcr do
    it "gets all achievement IDs" do
      expect(subject.all_achievements[0]).to be 1
    end
  end

  describe ".achievement_info", :vcr do
    it "gets info for an achievement ID" do
      expect(subject.achievement_info(1)[:id]).to be 1
    end

    it "gets info for multiple achievement IDs" do
      expect(subject.achievement_info([1,2])[0][:name]).to eq("Centaur Slayer")
    end
  end

  describe ".achievement_categories", :vcr do
    it "gets all achievement category IDs when no ID provided" do
      expect(subject.achievement_categories[3]).to be_an Integer
    end

    it "gets category information when provided ID" do
      expect(subject.achievement_categories(1)[:achievements]).to be_an Array
    end

    it "gets category information when provided multiple IDs" do
      expect(subject.achievement_categories([1,2])[0][:name]).to eq("Slayer")
    end
  end

  describe ".achievement_groups", :vcr do
    it "gets all achievement group IDs when no ID provided" do
      expect(subject.achievement_groups[3]).to be_a String
    end

    it "gets group information when provided ID" do
      expect(subject.achievement_groups("647D3B02-2302-41F0-88A3-6D88BB6F55CF")[:name]).to eq("Festivals")
    end

    it "gets group information when provided multiple IDs" do
      expect(subject.achievement_groups(["647D3B02-2302-41F0-88A3-6D88BB6F55CF",
        "A4ED8379-5B6B-4ECC-B6E1-70C350C902D2"])[1][:name])
        .to eq("Story Journal")
    end
  end
end
