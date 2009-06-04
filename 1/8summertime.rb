$KCODE = 'utf'
p Time.local(2006, 1, 1)
p Time.local(2006, 1, 1).isdst # 夏時間かどうかを調べる。
p Time.local(2006, 10, 1)
p Time.local(2006, 10, 1).isdst # EDTだったらtrueが返るらしいが駄目。

ENV['TZ'] = 'US/Pacific'
p eastern = Time.local(2006, 10, 1)
p eastern.isdst

# ナバホ居住地をのぞき、アリゾナ州では夏時間を私用しない
ENV['TZ'] = 'America/Phoenix'
p arizona = Time.local(2006, 10, 1)
p arizona.isdst

ENV['TZ'] = nil # 最後にタイムゾーンを元に戻しておく。

ENV['TZ'] = 'America/Phoenix' # でも以降の例で使用するからまた設定する(JSTに夏時間が無いので…)

p '夏時間は1918年3月31日に施行された'
p Time.local(1918, 3, 31).isdst
p Time.local(1918, 4, 1).isdst
p Time.local(1919, 4, 1).isdst

p '連邦法は1919年に廃止されたが、一部の地域では夏時間を使用し続けていた'

p Time.local(1920, 4, 1).isdst
ENV['TZ'] = 'US/Pacific'
p Time.local(1920, 4, 1)

#ENV['TZ'] = nil
p Time.local(1920, 4, 1)
p '第二次世界大戦中に再び夏時間が導入された'
p Time.local(1942, 2, 9).isdst
p Time.local(1942, 2, 10).isdst
p '2007年より3月から11月にかけて夏時間となった。'
p Time.local(2007, 3, 13).isdst
