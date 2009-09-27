$KCODE = 'utf'
require 'date'
class Time
  def to_datetime # !> method redefined; discarding old to_datetime
    # 秒＋100分の１秒を分数秒に変換する
    p sec
    p 10**6
    p usec
    p seconds = sec + Rational(usec, 10**6)

    # 分単位のUTCオフセットを少数日に変換する
    offset = Rational(utc_offset, 60 * 60 * 24)
    DateTime.new(year, month, day, hour, min, seconds, offset)
  end
end

p time = Time.gm(2000, 6, 4, 10, 30, 22, 4010)
p time.to_datetime.to_s

class Date
  def to_gm_time
    to_time(new_offset, :gm)
  end
  
  def to_local_time
    to_time(new_offset(DateTime.now.offset - offset), :local)
  end

  private
  def to_time(dest, method)
    usec = (dest.sec_fraction * 60 * 60 * 24 * (10**6).to_i)
    Time.send(method, dest.year, dest.month, dest.day, dest.hour, dest.min, dest.sec, usec)
  end
end
p 'break'
p (datetime = DateTime.new(1990, 10, 1, 22, 16, Rational(41,2))).to_s # !> (...) interpreted as grouped expression
p datetime.to_gm_time
p datetime.to_local_time
