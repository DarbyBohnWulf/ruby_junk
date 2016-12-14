require 'trader'

describe Trader do

  describe ".stock_picker" do
    context "when you feed it an array of integers" do
      it "returns an array of the best buying price and the best selling price" do
        expect(Trader.stock_picker([6,5,3,7,28,39,69,4,7,8])).to eq([3,69])
      end
    end
  end
end
