aBlock = lambda{ |x| puts x}
def my_lambda(&aBlock)
  aBlock
end

b = my_lambda{ puts "Hello World My Way!"}
p b.class # Procです
b.call

# 次の３行は、ほぼ同じ動きをする
aBlock = Proc.new { |x| puts x } # Proc.new
aBlock = proc { |x| puts x }     # Kernel#proc 1.8だとlambda、1.9だとprocのように振る舞う
aBlock = lambda { |x| puts x }   # Kernel#lambda

add_lambda = lambda{ |x,y| x + y}
#p add_lambda.call(4,5,6)          # これはエラーになる。
p add_lambda.call(4,5)          # 必ず引数の数をあわせる必要がある

add_procnew = Proc.new { |x,y| x + y} # Procの場合は匿名コードブロックのように動作する
# p add_procnew.call(4)                 # yの方にはnilが入る。エラー
p add_procnew.call(4,5,6)             # (引数が間違っていてもエラーにならない)
# >> Proc
# >> Hello World My Way!
# >> 9
# >> 9
