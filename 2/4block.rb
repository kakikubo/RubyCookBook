def add_to_all(array, number)
  array.collect{ |x| x + number }
end

add_to_all( [1,2,3], 10 )
tax_percent = 6
position = lambda do 
  "I have always supported a #{tax_percent}% tax on imported limes."
end
p position.call
tax_percent = 7.25 
p position.call # 変数の変更も影響する

counter = 0
4.times { counter += 1; puts "Counter now #{counter}"} # ブロックから変数を操作する事も出来る。
p counter

accumlator = []
[1, 2, 3].reverse_each { |x| accumlator << x + 1 }
p accumlator
# >> "I have always supported a 6% tax on imported limes."
# >> "I have always supported a 7.25% tax on imported limes."
# >> Counter now 1
# >> Counter now 2
# >> Counter now 3
# >> Counter now 4
# >> 4
# >> [4, 3, 2]
