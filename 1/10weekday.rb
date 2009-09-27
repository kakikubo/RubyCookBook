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

print_every_sunday(Time.local(2009, 9, 1), Time.local(2009, 9, 30))

# 1年の何週目の週かを表すメソッド week
module Week
  def week
    (yday + 7 - wday) / 7
  end
end
class Date
  include Week
end

class Time
  include Week
end

saturday = DateTime.new(2009, 1, 3)
p saturday.week
p (saturday + 1).week # !> (...) interpreted as grouped expression
p (saturday - 1).week # !> (...) interpreted as grouped expression


# >> 09/06/09
# >> 09/13/09
# >> 09/20/09
# >> 09/27/09
# >> 0 #当日は一週目(0)
# >> 1 #次の日は２週目
# >> 0 #前日は１週め(0)
