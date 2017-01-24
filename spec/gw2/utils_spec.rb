require "spec_helper"

describe GW2::Utils do
  subject{GW2::Utils}
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

  describe "symbolize_keys" do
    it 'converts key strings to key symbols' do
      expect(subject.symbolize_keys({"a"=>"b", "c"=>"d"})).to eq({:a=> "b", :c=> "d"})
    end

    it 'converts key strings to key symbols when nested in arrays' do
      expect(subject.symbolize_keys([{"a"=>:b, "c"=>:d}])).to eq([{a: :b, c: :d}])
    end
  end
end
