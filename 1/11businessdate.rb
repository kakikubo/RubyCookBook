$KCODE = 'utf'
require 'date'
# 商業年度は2010年1月4日からになる。
# ※商業日は月曜日から始まるのが通例の模様
sunday = DateTime.new(2010, 1, 3) # 2010年1月3日(日)
p sunday.year   # カレンダー上は2010年
p sunday.cwyear # 日曜日は2009年度に入るらしい
p sunday.cweek  # 2009年度の53週目
p sunday.wday   # 2010年度の最初の日ではあるが
p sunday.cwday  # 2009年度的には7日目になる？
monday = sunday + 1
p monday.cwyear
p monday.cweek  # 1週目になる(1/4) 1で始まるみたいよ。

# cwdayでは日曜日は7になる。
(sunday...sunday+7).each do |d|
  puts "#{d.strftime("%a")} #{d.wday} #{d.cwday}"
end
# >> 2010
# >> 2009
# >> 53
# >> 0
# >> 7
# >> 2010
# >> 1
# >> Sun 0 7
# >> Mon 1 1
# >> Tue 2 2
# >> Wed 3 3
# >> Thu 4 4
# >> Fri 5 5
# >> Sat 6 6
