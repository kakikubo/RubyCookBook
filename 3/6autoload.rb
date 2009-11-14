require 'functions' # functions.rbを読み込み
p Decidable.class


# require "set" としなくても"autoload"で必要に応じて呼び出し
autoload :Set, "set.rb"
def random_set(size)
  max = size * 10
  set = Set.new
  # size分がsetにセットされるまで乱数を入れ続ける
  set << rand(max) until set.size == size
  return set
end

p random_set(10)
# >> Module
# >> #<Set: {11, 45, 56, 51, 68, 13, 90, 31, 15, 70}>
