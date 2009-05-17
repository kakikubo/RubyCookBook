$KCODE = 'utf8'
require 'date'

# class Date
#   def Date.now
#     return Date.jd(DateTime.now.jd)
#   end
# end
# puts Date.now
# 1.8.6の環境では残念ながら動作しなかった。
# 2006-03-18 のような形式が返る筈だが結果は↓
# irb(main):007:0> puts Date.now
# SystemStackError: stack level too deep
# 	from (irb):3:in `now'
# 	from (irb):3:in `now'
# 	from (irb):7

# 代わりのお題
#
p 'イタリア(グレゴリオ歴)では1582年10月4日の翌日が10月15日'
p Date.new(1582, 10, 4).to_s
#p Date.new(1582, 10, 5).to_s # ArgumentError
p Date.new(1582, 10, 4).succ.to_s

p 'イギリスでは 1752年9月2日の翌日が1752年9月14日'
p Date.new(1752, 9, 2, Date::ENGLAND).to_s
# p Date.new(1752, 9, 3, Date::ENGLAND).to_s # ArgumentError
p Date.new(1752, 9, 2, Date::ENGLAND).succ.to_s
p Date.new(1582, 10, 5, Date::ENGLAND).to_s # グレゴリオ歴でないから1582/10/5が存在する
# p Date.new(1582, 10, 5, Date::ITALY).to_s # グレゴリオ歴にすると駄目




