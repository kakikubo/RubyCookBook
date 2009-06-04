$KCODE = 'utf'
require 'date'
class Time
  def to_datetime # !> method redefined; discarding old to_datetime
    # 秒＋100分の１秒を分数秒に変換する
    p seconds = sec + Rational(usec, 10**6)

    # 分単位のUTCオフセットを少数日に変換する
    offset = Rational(utc_offset, 60 * 60 * 24)
    DateTime.new(year, month, day, hour, min, seconds, offset)
  end
end

p time = Time.gm(2000, 6, 4, 10, 30, 22, 4010)
p time.to_datetime.to_s
# >> Sun Jun 04 10:30:22 UTC 2000
