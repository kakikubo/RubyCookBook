class MultiArray
  include Enumerable

  def initialize(*arrays)
    @arrays = arrays
  end

  def each
    @arrays.each { |a| a.each { |x| yield x }}
  end
end

ma = MultiArray.new([1, 2], [3], [4])
ma.collect
ma.detect { |x| x > 3 }
ma.map { |x| x ** 2 }
ma.sort
ma.each_with_index { |x, i| puts "Element #{i} is #{x}" }
p mixed_type_ma = MultiArray.new([1,2,3],["a","b","c"])
# mixed_type_ma.sort #これは失敗する
# [1,2,3,"a","b","c"].sort # これも

# 後ろでfind_allが使えるように
class Module
  include Enumerable
  def each
    instance_methods.each { |x| yield x }
  end
end
# 文字列を直接変更するStringのインスタンスメソッドをすべて検出する
# 「?!」→!のASCII文字のコードを得ている
# method_name[-1] => 配列内の要素の末尾文字のASCIIコードを得る
p String.find_all { |method_name| ; method_name[-1] == ?! }
sample = 0
# arityは引数の数を得るメソッドらしい
p sample.class.find_all { |method_name| sample.method(method_name).arity == 2 }


# >> Element 0 is 1
# >> Element 1 is 2
# >> Element 2 is 3
# >> Element 3 is 4
# >> #<MultiArray:0x1001a3f28 @arrays=[[1, 2, 3], ["a", "b", "c"]]>
# >> ["upcase!", "gsub!", "downcase!", "chop!", "capitalize!", "tr!", "chomp!", "swapcase!", "tr_s!", "succ!", "strip!", "delete!", "lstrip!", "squeeze!", "next!", "rstrip!", "slice!", "reverse!", "sub!"]
# >> Fixnum
# >> ["between?", "instance_variable_set"]
