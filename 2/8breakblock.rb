1.upto(10) do |x|
  puts x
  break if x == 3
end
# でもbreakはProc.newやRuby 1.9のprocでは使えない。
# aBlock = Proc.new do |x|
aBlock = Proc.new do |x|
  puts x
  break if x == 3
  puts x + 2
end
aBlock.call(5)
# aBlock.call(3)　エラーになってしまう。
# Proc.newやRuby 1.9のprocの代わりにlambdaを使えばエラーにはならない

def find(*paths)
  paths.each do |p|
    catch(:prune) do
      # p をファイルまたはディレクトリとして処理する…
    end
    # Find.pruneを呼び出すと、ここで終わる
  end
end

def prune
  throw :prune
end
# TODO 16-27 はよく意味がわからなかった…。
p find("/Users/kakikubo/gnu")
# >> 1
# >> 2
# >> 3
# >> 5
# >> 7
# >> ["/Users/kakikubo/gnu"]
