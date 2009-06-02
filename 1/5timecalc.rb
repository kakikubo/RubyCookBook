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
# >> Sat Jan 01 00:00:01 UTC 2000
# >> Fri Dec 31 23:59:59 UTC 1999
# >> Sun Dec 31 00:00:00 UTC 2000
# >> "2000-01-02T00:00:00+00:00"
# >> "1999-12-31T00:00:00+00:00"
# >> "2000-01-01T12:00:00+00:00"
# >> "2000-12-31T00:00:00+00:00"
# >> 86400.0
# >> -86400.0
# >> Rational(1, 1)
# >> Rational(-1, 1)
# >> 1.000377
# >> Rational(37053, 3200000000)
# >> Sat May 23 22:14:46 +0900 2009
# >> Thu Jul 02 22:14:46 +0900 2009
# >> Sun Jan 15 00:00:00 +0900 2006
# >> Fri Dec 31 00:00:00 UTC 1999
# >> Sat Apr 01 00:00:00 UTC 2006
# >> Sat Apr 01 00:00:00 UTC 2006
# >> "2000-02-01T00:00:00+00:00"
# >> "1999-12-01T00:00:00+00:00"
# >> Tue, 01 Feb 2000 00:00:00 +0000
# >> Wed, 01 Dec 1999 00:00:00 +0000
# >> "2000-09-30"
# >> "2000-11-30"
# >> "2000-12-31"
# >> "1996-01-29"
# >> "1996-03-29"
# >> "1997-02-28"
# >> "1992-02-29"
