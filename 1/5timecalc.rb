require 'date'
y2k = Time.gm(2000, 1, 1)
p y2k + 1
p y2k - 1
p y2k + (60 * 60 * 24 * 365)

y2k_dt = DateTime.new(2000, 1, 1)
p (y2k_dt + 1).to_s # !> (...) interpreted as grouped expression
p (y2k_dt - 1).to_s # !> (...) interpreted as grouped expression
p (y2k_dt + 0.5).to_s # !> (...) interpreted as grouped expression
p (y2k_dt + 365).to_s # !> (...) interpreted as grouped expression

day_one = Time.gm(1999, 12, 31)
day_two = Time.gm(2000, 1, 1)
p day_two - day_one
p day_one - day_two

day_one = DateTime.new(1999, 12, 31)
day_two = DateTime.new(2000, 1, 1)
p day_two - day_one
p day_one - day_two

# 現在と１秒後を比較する
before_time = Time.now
before_datetime = DateTime.now
sleep(1)
p Time.now - before_time
p DateTime.now - before_datetime

# activesupportを使う
require 'rubygems'
require 'activesupport'

p 10.days.ago
p 1.month.from_now
p 2.weeks.since(Time.local(2006, 1, 1))
p y2k - 1.day
p y2k + 6.3.years
p 6.3.years.since y2k # !> parenthesize argument(s) for future version

# '>>'演算子などを使うと、ひとつ大きな単位を操作できる(+-だと日、>>だと月)。これも activesupport の機能
p (y2k_dt >> 1).to_s # !> (...) interpreted as grouped expression
p (y2k_dt << 1).to_s # !> (...) interpreted as grouped expression

# activesupportのNumeric#month でも同様の効果が得られる
# (古いactivesupportだと１ヶ月が３０日として計算されるらしい。2.3.2ではきちんとひと月前の日が返ってくる。)
p y2k_dt + 1.month
p y2k_dt - 1.month

# 9月は30日までしかない
halloween = Date.new(2000, 10, 31)
p (halloween << 1).to_s  # !> (...) interpreted as grouped expression
p (halloween >> 1).to_s  # !> (...) interpreted as grouped expression
p (halloween >> 2).to_s  # !> (...) interpreted as grouped expression

# うるう年
leap_year_day = Date.new(1996, 2, 29)
p (leap_year_day << 1).to_s # !> (...) interpreted as grouped expression
p (leap_year_day >> 1).to_s # !> (...) interpreted as grouped expression
p (leap_year_day >> 12).to_s # !> (...) interpreted as grouped expression
p (leap_year_day << 12 * 4).to_s # !> (...) interpreted as grouped expression
