class Trader
  def self.stock_tracker(prices)
    ordered_prices = Hash.new
    count = 1
    prices.each {|p|
      ordered_prices[count] = p
      count+= 1
    }
    buying_days = prices[0,-2].sort
    selling_days = prices[1,-1].sort
    if ordered_prices.key buying_days[0] < ordered_prices.key selling_days[-1]
      final_prices = [buying_days.first,selling_days.last]
    elsif ordered_prices.key buying_days. > ordered_prices.key selling_days.last

    end
    final_prices
  end
end
