# frozen_string_literal: true

require 'date'

# Class PortFolio to get profit of stocks
class Portfolio
  attr_accessor :stocks

  def initializer(stocks)
    @stocks = stocks
  end

  def profit(date_start, date_end)
    dates = format_dates(date_start, date_end)
    profit = calculate_profit(dates)
    difference_in_days = (dates[:end] - dates[:start]).to_i
    cumulative_return = profit / profit_date_start
    annualized = annualized_return(cumulative_return, difference_in_days)
    response_profit(profit, annualized)
  end

  private
  
  def format_dates(date_start, date_end)
    {
      start: Date.parse(date_start),
      end: Date.parse(date_end)
    }
  end
  
  def price_dates(dates)
    {
      start: avg_stock_by_date(dates[:start]),
      end: avg_stock_by_date(dates[:end])
    }
  end
  
  def calculate_profit(dates)
    prices_dates = price_dates(dates)
    prices_dates[:end] - prices_dates[:start]
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
  
  def response_profit(profit, annualized_return)
    { profit: profit, annualized_return: annualized }
  end
end
