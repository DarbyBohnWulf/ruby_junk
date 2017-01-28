require "my_enumerable"

def array
  [1,2,3]
end

some_proc = Proc.new do |pee|
  pee**pee
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

  context "when cathelled with a block" do
    it "collects the original members based on the given block"  do
      expect {|b| array.my_select(&b)}.to yield_successive_args(1,2,3)
      expect(array.my_select {|s| s % 2 == 0}).to eq([2])
    end
  end
end

describe "#my_all?" do
  context "when called on a collection" do
    it "verifies every element conforms to the  given block"  do
      expect(array.my_all?).to be(true)
      expect(array.my_all? {|s| s % 2 == 0}).to be(false)
    end
  end
end

describe "#my_any?" do
  context "when called on a collection" do
    it "verifies at least one element conforms to the given block"  do
      expect(array.my_any?).to be(true)
      expect(array.my_any? {|a| a % 2 == 0}).to be(true)
    end
  end
end

describe "#my_none?" do
  context "when called on a collection" do
    it "verifies none of the elements conform to the given block"  do
      expect(array.my_none?).to be(false)
      expect(array.my_none? {|a| a > 3}).to be(true)
    end
  end
end

describe "#my_count" do
  context "when called on a collection" do
    it "returns the number of elements that return true"  do
      expect(array.my_count).to eq(3)
      expect(array.my_count {|a| a % 2 == 0}).to eq(1)
    end
  end
end

describe '#my_map' do
  context 'when called on a collection' do
    it 'returns a new collection with the results of the given block' do
      expect(array.my_map).to be_an(Enumerator)
      expect(array.my_map { |a| a**a }).to eq([1,4,27])
      expect(array.my_map some_proc).to eq([1,4,27])
    end
  end
end

describe '#my_inject' do
  context 'when called on a collection' do
    it 'combines all elements based on a given binary operation' do
      expect(array.my_inject { |sum,abj| sum + abj }).to eq(6)
      expect(array.my_inject { |dif,a| dif - a}).to eq(-4)
    end
  end
end

describe "#multiply_els" do
  context "when called with an array as argument" do
    it "uses #my_inject to find the product of the members"  do
      expect(Enumerable.multiply_els([1,2,3,4])).to eq(24)
    end
  end
end
