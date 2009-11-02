array = %w{ bob loves alice }
p array.collect { |x| x.capitalize }
# ["Bob", "Loves", "Alice"]
# array.collect_reverse { |x| x.capitalize } みたいなことをやりたいんだけど…
# そこでeachを上書きせずに、副作用のない解決策
require 'enumerator'
reversed_array = array.to_enum(:reverse_each) #配列をEnumeratorで包む
p reversed_array.collect { |x| x.capitalize }

reversed_array.each_with_index do |x,i|
  puts %{ #{i} => "#{x}" }
end

p reversed_array.class
# TODO http://jp.rubyist.net/magazine/?0011-BundledLibraries ここを一度読んでおくことにしましょう。

array_with_index = array.enum_with_index
array_with_index.each do |x,i|
  puts %{ #{i} => "#{x}" }
end

array_with_index.each_with_index do |x,i|
  puts %{ #{i} => "#{x.inspect}" }
end

sentence = %w{ Well, not Ive seen everything }

two_word_window = sentence.to_enum(:each_cons, 2)
two_word_window.each { |x| puts x.inspect }

two_words_at_a_time = sentence.to_enum(:each_slice, 2)
two_words_at_a_time.each { |x| puts x.inspect }

# >> ["Bob", "Loves", "Alice"]
# >> ["Alice", "Loves", "Bob"]
# >>  0 => "alice" 
# >>  1 => "loves" 
# >>  2 => "bob" 
# >> Enumerable::Enumerator
# >>  0 => "bob" 
# >>  1 => "loves" 
# >>  2 => "alice" 
# >>  0 => "["bob", 0]" 
# >>  1 => "["loves", 1]" 
# >>  2 => "["alice", 2]" 
# >> ["Well,", "not"]
# >> ["not", "Ive"]
# >> ["Ive", "seen"]
# >> ["seen", "everything"]
# >> ["Well,", "not"]
# >> ["Ive", "seen"]
# >> ["everything"]
