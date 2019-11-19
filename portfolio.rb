# frozen_string_literal: true

# Class PortFolio to get profit of stocks
class Portfolio
  attr_accessor :stocks

  def initializer(stocks)
    @stocks = stocks
  end

  def profit(date_start, date_end)
    date_start = format_date(Time.new(date_start))
    date_end = format_date(Time.new(date_end))
    profit_date_start = avg_stock_by_date(date_start)
    profit_date_end = avg_stock_by_date(date_end)
    profit = profit_date_start - profit_date_end
    difference_in_days = (date_start - date_end).to_i
    cumulative_return = profit / profit_date_start
    annualized = annualized_return(cumulative_return, difference_in_days)
    { profit: profit, annualized_return: annualized }
  end

  private

  def format_date(date)
    date.strftime('%Y-%m-%d')
  end

  def avg_stock_by_date(date)
    total_price_by_date(date) / stock.count
  end

  def total_price_by_date(date)
    stock.inject(0) do |total_price, stock|
      stock.price(date) + total_price
    end
  end

  def annualized_return(cumulative_return, difference_in_days)
    ((1 + cumulative_return) ^ (365 / difference_in_days)) - 1
  end
end
