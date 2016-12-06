require 'trader'

describe Trader do

  describe ".stock_tracker" do
    context "when you feed it an array of integers" do
      it "returns an array of the best buying price and the best selling price" do
        expect(Trader.stock_tracker([4,7,8,13,19,1])).to eq([4,19])
      end
    end
  end
end
