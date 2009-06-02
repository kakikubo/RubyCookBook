def last_modified(file)
  t1 = File.stat(file).ctime
  t2 = Time.now
  elapsed = (t2 - t1)/(60*60*24)
  puts "#{file} was last modified #{elapsed} days ago."
end

last_modified("/etc/passwd")
last_modified("/Users/kakikubo")

require 'date'
def advent_calender(date=DateTime.now)
  christmas = DateTime.new(date.year, 12, 25)
  christmas = DateTime.new(date.year + 1, 12, 25) if date > christmas
  difference = (christmas - date).to_i
  if difference == 0
    puts "Today is Christmas."
  else
    puts "Only #{difference} day#{"s" unless difference == 1} until Christmas."
  end
end

advent_calender(DateTime.new(2006, 12, 24))
advent_calender(DateTime.new(2006, 12, 25))
advent_calender(DateTime.new(2006, 12, 26))

# メール送信時間をみたければ
sent = DateTime.new(2006, 10, 4, 3, 15)
received = DateTime.new(2006, 10, 5, 16, 33)
elapsed = (received - sent) * 24
puts "You responded to my email #{elapsed.to_f} hours after I sent it."

# 特定の時間までのカウントダウンを表示する。
def remaining(date, event)
  intervals = [["day", 1], ["hour", 24], ["minute", 60], ["second", 60]]
  elapsed = DateTime.now - date
  tense = elapsed > 0 ? "since" : "until"  
  interval = 1.0
  parts = intervals.collect do |name, new_interval|
    interval /= new_interval # ここでどんどん単位を変換していっている1 -> 1/24 -> 1/60 -> 1/60
    number, elapsed = elapsed.abs.divmod(interval)
    "#{number.to_i} #{name}#{"s" unless number == 1}"
  end
  puts "#{parts.join(",")} #{tense} #{event}."
end

remaining(DateTime.new(2006, 4, 15, 0, 0, 0, DateTime.now.offset), "the book deadline")
remaining(DateTime.new(1999, 4, 23, 8, 0, 0, DateTime.now.offset), "the Math 114A final")
remaining(DateTime.new(1977, 3, 13, 13, 0, 0, DateTime.now.offset), "kakikubo teruo birthday")
