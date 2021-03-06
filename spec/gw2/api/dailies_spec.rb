describe GW2::API::Dailies do
  subject{GW2.client}
  describe ".dailies", :vcr do
    it "gets the dailies for today" do
      expect(subject.dailies[:pve][0][:id]).to be_an Integer
    end
  end

  describe ".dailies_tomorrow", :vcr do
    it "gets the dailies for tomorrow" do
      expect(subject.dailies_tomorrow[:pve][0][:id]).to be_an Integer
    end
  end
end
