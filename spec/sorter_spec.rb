require "sorter"

describe "::bubble_sort" do
  context "when given an array of integers" do
    it "returns the array fully sorted as if by spaceship"  do
      expect(Sorter.bubble_sort([5,1,9,3,4,7,2,8,6])).to eq([1,2,3,4,5,6,7,8,9])
    end
  end
end

describe "::bubble_sort_by" do
  context "when given an array and a block" do
    result = Sorter::bubble_sort_by(['heap','sheep','pterodactyl','lemming','ant']) do |left,right|
      left.length - right.length
    end
    it "returns an array sorted as if by spaceship"  do
      expect(result).to eq(['ant','heap','sheep','lemming','pterodactyl'])
    end
  end
end
