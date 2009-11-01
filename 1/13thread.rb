3.downto(1){ |i| puts "#{i}..."; sleep(1)}; puts "Go!"

# p Time.new
# sleep(10)
# p Time.new
# sleep(1)
# p Time.new

# スリープは一秒未満
p Time.new.usec
sleep(0.1)
p Time.new.usec

# どのくらいまでsleepの精度を細かくできるか
# interval = 1.0
# 10.times do |x|
#   t1 = Time.new
#   sleep(interval)
#   actual = Time.new - t1

#   difference = (actual - interval).abs
#   percent_difference = difference / interval * 100
#   printf("Expected: %.9f Actual: %.6f Difference: %.6f (%.2f%%)\n",
#          interval, actual, difference, percent_difference)
#   interval /= 10
# end

alarm = Thread.new(self) { sleep(5); Thread.main.wakeup }
puts "Going to sleep for 100 seconds at #{Time.new}..."
sleep(10000); puts "Woke up at #{Time.new}!"

alarm = Thread.new(self) { sleep(5); Thread.main.wakeup }
puts "Goodbye, cruel world!";
Thread.stop;
puts "I'm back; how'd that happen?"
# >> 3...
# >> 2...
# >> 1...
# >> Go!
# >> 952107
# >> 52413
# >> Going to sleep for 100 seconds at Wed Oct 28 21:41:06 +0900 2009...
# >> Woke up at Wed Oct 28 21:41:11 +0900 2009!
# >> Goodbye, cruel world!
# >> I'm back; how'd that happen?
