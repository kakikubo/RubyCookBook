$KCODE='utf8'
require 'date'

# ヨーロッパの日付(日、月、年)
# アメリカの日付  (月、日、年)

p Date.parse('2/9/2007').to_s
p DateTime.parse('02-09-2007 12:30:44 AM').to_s
p DateTime.parse('02-09-2007 12:30:44 PM EST').to_s
p Date.parse('Wednesday, January 10, 2001').to_s

p 'アメリカ日付'
american_date = '%m/%d/%y'
p Date.strptime('2/9/07', american_date).to_s
p DateTime.strptime('2/9/05', american_date).to_s
p Date.strptime('2/9/68', american_date).to_s # 2068年になる
p Date.strptime('2/9/69', american_date).to_s # 1969年になる
p 'ヨーロッパ日付'
european_date = '%d/%m/%y'
p Date.strptime('2/9/07', european_date).to_s
p Date.strptime('02/09/68', european_date).to_s
p Date.strptime('2/9/69', european_date).to_s
p '4桁の西暦'
four_digit_year_date = '%m/%d/%Y'
p Date.strptime('2/9/2007', four_digit_year_date).to_s
p Date.strptime('02/09/1968', four_digit_year_date).to_s
p Date.strptime('2/9/69', four_digit_year_date).to_s
p '日付'
date_and_time = '%m-%d-%Y %H:%M:%S %Z'
p DateTime.strptime('02-09-2007 12:30:44 EST', date_and_time).to_s
p DateTime.strptime('02-09-2007 12:30:44 PST', date_and_time).to_s
p DateTime.strptime('02-09-2007 12:30:44 GMT', date_and_time).to_s
p '１２時間表記'
twelve_hour_clock_time = '%m-%d-%Y %I:%M:%S %p'
p DateTime.strptime('02-09-2007 12:30:44 AM', twelve_hour_clock_time).to_s
p DateTime.strptime('02-09-2007 12:30:44 PM', twelve_hour_clock_time).to_s
p '文字列表記'
word_date = '%A, %B %d, %Y'
p Date.strptime('Wednesday, January 10, 2001', word_date).to_s


p Date.parse('1/10/07').to_s
#p Date.parse('2007 1 10').to_s # これはエラーになる(わざと)
p '2つのフォーマットを試すメソッド'
TRY_FORMATS = ['%d/%m/%y', '%Y %m %d']
def try_to_parse(s)
  parsed = nil
  TRY_FORMATS.each do |format|
    begin
      parsed = Date.strptime(s,format)
      break
    rescue ArgumentError
    end
  end
  return parsed
end

p try_to_parse('1/10/07').to_s
p try_to_parse('2007 1 10').to_s

# Time.rfc822(RFC822/RFC2822 電子メールの標準日付フォーマット)
require 'time'
mail_received = 'Tue, 1 Jul 2003 10:52:37 +0200'
p Time.rfc822(mail_received)
# Time.httpdate(RFC2616 HTTP標準)
last_modified = 'Tue, 05 Sep 2006 16:05:51 GMT'
p Time.httpdate(last_modified)
# Time.xmlschema(ISO8601. XMLスキーマとも呼ばれる)
timestamp = '2001-04-17T19:23:17.201Z'
p t = Time.iso8601(timestamp)
p t.sec
p t.tv_usec


p 'クラスメソッドとインスタンスメソッドを混同しないように!'
p 'クラスメソッドは文字列からTimeオブジェクトを生成する'
t = Time.at(1000000000)
p 'インスタンスメソッドはTimeオブジェクトから文字列を生成する'
p t.rfc822 
p t.httpdate
p t.iso8601

# ri Time#strftime


