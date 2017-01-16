require "my_enumerable"

def array
  [1,2,3]
end

describe "#my_each" do
  context "when called alone" do
    it "returns an enumerator"  do
      expect(array.my_each).to be_an(Enumerator)
    end
  end

  context "when called with a block" do
    it "calls the block on successive members of the object" do
      expect {|b| array.my_each &b }.to yield_successive_args(1,2,3)
    end
  end
end

describe "#my_each_with_index" do
  context "when called on a collection" do
    it "behaves as each..."  do
      expect(array.my_each_with_index).to be_an(Enumerator)
    end

    it "...but uses index as the first argument with blocks"  do
      expect {|b| array.my_each_with_index &b}.to yield_successive_args([0,1],[1,2],[2,3])
    end
  end
end

describe "#my_select" do
  context "when called without a block" do
    it "returns an enumerator"  do
      expect(array.my_select).to be_an(Enumerator)
    end
  end

  context "when called with a block" do
    it "collects the original members based on the given block"  do
      expect {|b| array.my_select(&b)}.to yield_successive_args(1,2,3)
      expect(array.my_select {|s| s % 2 == 0}).to eq([2])
    end
  end
end

describe "#my_all?" do
  context "when called on a collection w/o negative members" do
    it "returns true"  do
      expect(array.my_all?).to be(true)
    end
  end
end
