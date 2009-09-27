$KCODE = 'utf'
require 'date'

def every_sunday(d1, d2)
  # Railsを使用している場合には、60*60*24の代わりに1.dayを使用できる
  one_day = d1.is_a?(Time) ? 60*60*24 : 1
  sunday = d1 + ((7-d1.wday) % 7) * one_day
  while sunday < d2
    yield sunday
    sunday += one_day * 7
  end
end

def print_every_sunday(d1, d2)
  every_sunday(d1, d2) { |sunday| puts sunday.strftime("%x")}
end

print_every_sunday(Time.local(2006, 1, 1), Time.local(2006, 2, 4))
