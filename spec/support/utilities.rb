# def select_date(date, options = {})
#   field = options[:from]
#   select date.strftime('%Y'),   from: "#{field}_1i" # year
#   select Date::MONTHNAMES[date.month], from: "#{field}_2i" # month name
#   select date.strftime('%-d'), from: "#{field}_3i" # day of the month
# end
