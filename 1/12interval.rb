$KCODE = 'utf'
require 'date'
# コードブロックの定期実行
# ※結局、末尾のコードはうまくいっていない  FIXME


# コードブロックの実行時間も考慮している
def every_n_seconds(n)
  loop do 
    before = Time.now
    yield
    interval = n - (Time.now - before)
    sleep(interval) if interval > 0
  end
end

# コードブロックの実行時間を考慮しない場合は単純
def every_n_seconds_normal(n)
  loop do
    yield
    sleep(n)
  end
end

# 
def every_n_seconds_thread(n)
  thread = Thread.new do
    while true
      before = Time.now
      yield
      interval = n - (Time.now - before)
      sleep(interval) if interval > 0
    end
  end
  return thread
end

# every_n_seconds(5) do
#   puts "At the beep, the time will be #{Time.now.strftime("%X")}... beep!"
# end

# every_n_seconds_normal(1) do
#   puts "At the beep, the time will be #{Time.now.strftime("%X")}... beep!"
# end

def monitor_changes(file, resolution=1)
  last_change = Time.now
  every_n_seconds_thread(resolution) do 
    check = File.stat(file).ctime
    puts last_change
    puts check
    if check > last_change
      yield file
      last_change = check
    elsif Time.now - last_change > 60
      puts "Nothing's happened for a minute, I'm bored."
      break
    end
  end
end

thread = monitor_changes("/tmp/foo") {|file| puts "Someone changed #{file}!" }
p thread.status
