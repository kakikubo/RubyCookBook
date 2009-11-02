module Enumerable
  # 独自のfindメソッドを実装する。条件にマッチしても３つまでしか返さない
  def find_no_more_than(limit)
    inject([]) do |a,e|
      a << e if yield e
      return a if a.size >= limit
      a
    end
  end
end

a = [1,2,3,4,5,6,7,8,9.10]
p a.find_no_more_than(3){ |x| x % 2 == 0 }
# >> [2, 4, 6]
