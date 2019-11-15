# frozen_string_literal: true

class Portfolio
  attr_accessor :stock

  def profit(_date1=today_date, _date2=today_date)
    date1 = format_date(Time.new(_date1))
    date2 = format_date(Time.new(_date2))
    
  end

  private

  def today_date
    format_date(Time.now)
  end

  def format_date(date)
    date.strftime('%Y-%m-%d')
  end
end
