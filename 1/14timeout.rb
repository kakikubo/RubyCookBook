# まってました。timeout処理。
require 'timeout'
before = Time.now
begin
  status = Timeout.timeout(1){ sleep } # Timeout.timeoutがなければ永遠にsleepする。
rescue Timeout::Error
  puts "I only slept for #{Time.now - before} seconds"
end


def count_for_five_seconds
  $counter = 0
  begin
    Timeout::timeout(1){ loop { $counter += 1 }}
  rescue Timeout::Error
    puts "I can count to #{$counter} in 5 seconds. "
  end
end

count_for_five_seconds
p $counter
# p.38にかいてある最後の１文「つまり、データセットの整合性が失われる可能性がある」の意味がさっぱりわからない…。
# count_for_five_secondsで何を検証したかったのだろうか…。
  
