# frozen_string_literal: true

class Portfolio
  attr_accessor :stocks
  
  def initializer(stocks:)
    self.stocks = stocks
  end

  def profit(date1=today_date, date2=today_date)
    date1 = format_date(Time.new(_date1))
    date2 = format_date(Time.new(_date2))
    profit_date1 = self.stock.inject(0) {|total_price, stock| stock.price(date1) + total_price} / self.stock.count
    profit_date2 = self.stock.inject(0) {|total_price, stock| stock.price(date2) + total_price} / self.stock.count
    profit = profit_date1 - profit_date2
    annualized_return =  
  end

  private

  def today_date
    format_date(Time.now)
  end

  def format_date(date)
    date.strftime('%Y-%m-%d')
  end
end
