class Trader
  def self.stock_picker(prices)
    buying_day = prices[0]
    selling_day = prices.sort.last
    prices.each do |p|
      if prices.index(p) > prices.index(buying_day) && p > selling_day
        selling_day = p
      elsif prices.index(p) < prices.index(selling_day) && p < buying_day
        buying_day = p
      else
        nil
      end
    end
    [buying_day,selling_day]
  end
end
