def stock_picker(prices)
  max_profit = 0
  best_days = []

  # prices.each_with_index do |buy_price, buy_day|
  #   prices[buy_day + 1..].each_with_index do |sell_price, sell_day|
  #     profit = sell_price - buy_price

  #     if profit > max_profit
  #       max_profit = profit
  #       best_days = [buy_day, buy_day + 1 + sell_day]
  #     end
  #   end
  # end

  # best_days
  prices.each do |buy_price|
    puts "#{buy_price}"
  end

  prices.each_with_index do |buy_price, buy_day|
    puts "#{buy_price} and #{buy_day}"
  end
end

prices = [105, 180, 260]

best_days = stock_picker(prices)
puts "En iyi alım-satım günleri: #{best_days}"
