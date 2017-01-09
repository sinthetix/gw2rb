require "spec_helper"

describe GW2::API::Achievements do
  subject{GW2.client}
  describe ".all_achievements", :vcr do
    it "gets all achievement IDs" do
      expect(subject.all_achievements[0]).to be 1
    end
  end

  describe ".achievements_info", :vcr do
    it "gets info for an achievement ID" do
      expect(subject.achievements_info(1)).to be
        {
          :description => "A few more centaur herds are thinned out.",
          :flags => [],
          :id => 1,
          :locked_text => "",
          :name => "Centaur Slayer",
          :requirement => "Kill  centaurs.",
          :tiers => [{:count=>10, :points=>1}, {:count=>100, :points=>5}, {:count=>500, :points=>5}, {:count=>1000, :points=>5}],
          :type => "Default",
       }
    end

    it "gets info for multiple achievement IDs" do
      expect(subject.achievements_info([1,2])[0][:name]).to eq("Centaur Slayer")
    end
  end

  describe ".achievements_categories", :vcr do
    it "gets all achievement category IDs when no ID provided" do
      expect(subject.achievements_categories[0]).to be 1
    end

    it "gets category information when provided ID" do
      expect(subject.achievements_categories(1)).to be
        {
          :achievements => [1, 5, 4, 6, 7, 8, 16, 23, 24, 25, 26, 27, 28, 29, 31, 33, 32, 34, 35, 30, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 3, 49, 50, 51, 52, 53],
          :description => "",
          :icon => "https://render.guildwars2.com/file/E00460A2CAD85D47406EAB4213D1010B3E80C9B0/42675.png",
          :id => 1,
          :name => "Slayer",
          :order => 10,
        }
    end

    it "gets category information when provided multiple IDs" do
      expect(subject.achievements_categories([1,2])[0][:name]).to eq("Slayer")
    end
  end

  describe ".achievements_groups", :vcr do
    it "gets all achievement group IDs when no ID provided" do
      expect(subject.achievements_groups).to be
        [
          "4E6A6CE7-B131-40BB-81A3-235CDBACDAA9",
          "65B4B678-607E-4D97-B458-076C3E96A810",
          "647D3B02-2302-41F0-88A3-6D88BB6F55CF",
          "1CAFA333-0C2B-4782-BC4C-7DA30E9CE289",
          "18DB115A-8637-4290-A636-821362A3C4A8",
          "BE8B9954-5B55-4FCB-9022-B871AD00EAAB",
          "A9F7378E-9C8A-48CC-9505-3094E661D5F6",
          "56A82BB9-6B07-4AB0-89EE-E4A6D68F5C47",
          "45410F60-AB66-4146-A0F7-CE99250C4CB0",
          "A4ED8379-5B6B-4ECC-B6E1-70C350C902D2"
        ]
    end

    it "gets group information when provided ID" do
      expect(subject.achievements_groups("647D3B02-2302-41F0-88A3-6D88BB6F55CF")).to be
        {
          :id => "647D3B02-2302-41F0-88A3-6D88BB6F55CF",
          :name => "Festivals",
          :description => "Achievements related to the current Living World update.",
          :order => 4,
          :categories => [
            150
          ]
        }
    end

    it "gets group information when provided multiple IDs" do
      expect(subject.achievements_groups(["647D3B02-2302-41F0-88A3-6D88BB6F55CF",
        "A4ED8379-5B6B-4ECC-B6E1-70C350C902D2"]))
        .to eq([
          {
            :id => "647D3B02-2302-41F0-88A3-6D88BB6F55CF",
            :name => "Festivals",
            :description => "Achievements related to the current Living World update.",
            :order => 4,
            :categories => [150]
          },
          {
            :id => "A4ED8379-5B6B-4ECC-B6E1-70C350C902D2",
            :name => "Story Journal",
            :description => "Achievements related to the story journal.",
            :order => 2,
            :categories => [147, 144, 121, 122, 123, 104, 68, 100, 81, 83, 82, 71, 72, 70, 139]
          }
        ])
    end
  end
end
