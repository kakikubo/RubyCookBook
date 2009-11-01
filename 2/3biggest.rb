def biggest(collection, &block)
  block ? collection.select(&block).max : collection.max
end

array = [1,2,3,4,5]
biggest(array) { |i| i < 3 }  
biggest(array) { |i| i != 5 } 
biggest(array)                

def pick_random_numbers(min, max, limit)
  limit.times { yield min+rand(max+1)}
end

def lottery_style_numbers(&block)
  pick_random_numbers(1, 49, 6, &block)
end

lottery_style_numbers{ |n| puts "Lucky number: #{n}" }

def invoke_on_each(*args, &block)
  args.each{ |arg| yield arg}
end

invoke_on_each(1,2,3,4,5){ |x| puts x ** 2 }
# >> Lucky number: 19
# >> Lucky number: 34
# >> Lucky number: 22
# >> Lucky number: 29
# >> Lucky number: 7
# >> Lucky number: 38
# >> 1
# >> 4
# >> 9
# >> 16
# >> 25
