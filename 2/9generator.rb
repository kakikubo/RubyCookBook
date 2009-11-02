require 'generator'

# SyncEnumeratorで反復処理を同時に行う事ができる
enumerator = SyncEnumerator.new(%w{ Four seven}, %w{score years}, %w{ and ago})
enumerator.each do |row|
  row.each{ |word| puts word }
  puts '---'
end
enumerator = SyncEnumerator.new(%w{ Four and}, %w{score seven years ago})
enumerator.each do |row|
  row.each{ |word| puts word }
  puts '---'
end

def interosculate(*enumerables)
  generators = enumerables.collect { |x| Generator.new(x) }
  done = false
  until done
    done = true
    generators.each do |g|
      if g.next?
        yield g.next
        done = false
      end
    end
  end
end
puts '==='
interosculate(%w{ Four and}, %w{ score seven years ago}) do |x|
 puts x
end

l = ["junk1", 1, "junk2", 2, "junk3", "junk4", 3, "junk5"]
g = Generator.new(l)
# junkだけ飛ばしたいけど以下だとうまくいかない
p g.next
p g.next
p g.next
# junkだけ飛ばす処理を実装
def l.my_iterator
  each { |e| yield e unless e =~ /^junk/ }
end
l.my_iterator{ |x| puts x }
# l.my_iteratorと同様の処理を記述してみる。
g = Generator.new{ |g| l.each { |e| g.yield e unless e =~ /^junk/}}
p g.next
p g.next
p g.next
# さらに別解
g = Generator.new{ |g| l.my_iterator { |e| g.yield e}}
p g.next
p g.next
p g.next
def interosculate2(*iteratables)
  generators = iteratables.collect do |x|
    if x.is_a? Method
      Generator.new { |g| x.call { |e| g.yield e}}
    else
      Generator.new(x)
    end
  end
  done = false
  until done
    done = true
    generators.each do |g|
      if g.next?
        yield g.next
        done = false
      end
    end
  end
end
words1 = %w{ Four and years}
words2 = %w{ ago seven score} #こいつは逆になる↓
interosculate2(words1, words2.method(:reverse_each)){ |x| puts x }
# >> Four
# >> score
# >> and
# >> ---
# >> seven
# >> years
# >> ago
# >> ---
# >> Four
# >> score
# >> ---
# >> and
# >> seven
# >> ---
# >> nil
# >> years
# >> ---
# >> nil
# >> ago
# >> ---
# >> ===
# >> Four
# >> score
# >> and
# >> seven
# >> years
# >> ago
# >> "junk1"
# >> 1
# >> "junk2"
# >> 1
# >> 2
# >> 3
# >> 1
# >> 2
# >> 3
# >> 1
# >> 2
# >> 3
# >> Four
# >> score
# >> and
# >> seven
# >> years
# >> ago
