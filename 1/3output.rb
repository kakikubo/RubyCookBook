require 'date'
require 'time'

p Time.now.to_s
p DateTime.now.to_s
p Time.gm(2006).strftime('The Year is %Y!')
time = Time.gm(2005, 12, 31, 13, 22, 33)
american_date = '%D'
p time.strftime(american_date)

european_date = '%d/%m/%y'
p time.strftime(european_date)

four_digit_year_date = '%m/%d/%Y'
p time.strftime(four_digit_year_date)

date_and_time = '%m-%d-%Y %H:%M:%S %Z'
p time.strftime(date_and_time)

twelve_hour_clock_time = '%m-%d-%Y %I:%M:%S %p'
p time.strftime(twelve_hour_clock_time)

word_date = '%A, %B %d, %Y'
p time.strftime(word_date)

## require 'time'していれば以下が実行可能
p "rfc822   = " + time.rfc822
p "httpdate = " + time.httpdate
p "iso8601  = " + time.iso8601
p DateTime.now.to_s # iso8601 と同じ

# 必要な日付フォーマットに対応するフォーマットディレクティブが無い場合は自前で書く
class Time
  def day_ordinal_suffix
    if day == 11 or day == 12
      return "th"
    else
      case day % 10
      when 1 then return "st"
      when 2 then return "nd"
      when 3 then return "rd"
      else return "th"
      end
    end
  end
end
# 上記で追加定義したメソッドを使って、オリジナルフォーマットで表示してみる。
p time.strftime("The %e#{time.day_ordinal_suffix} of %B")
time = Time.gm(2005, 1, 3, 13, 22, 33)
p time.strftime("The %e#{time.day_ordinal_suffix} of %B")

# C-c C-d して実行結果をみてみてください。
