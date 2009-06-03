$KCODE = 'utf'
require 'date'

p 'gmtime'
p now = Time.now
p now = now.gmtime
p now = now.localtime

p 'offset'
p local = DateTime.now    # JST時刻
p utc = local.new_offset  # new_offsetはデフォルトが0
p local.offset            # 9/24h -> 3/8
p local_from_utc = utc.new_offset(local.offset) # オフセット値(+9)を渡す
p local_from_utc.to_s                           # localと 
p local == local_from_utc                       # 同じになる

p 'ローカル(東京)時間を太平洋標準時間に変換する'
japan = DateTime.now
p japan.to_s
p pacific_offset = Rational(-7, 24)
p pacific = japan.new_offset(pacific_offset) # 太平洋標準時間をセット
p pacific.to_s

# zoneinfo データベースも見てみよう(/usr/share/zoneinfo/配下)
class Time
  def convert_zone(to_zone)
    original_zone = ENV['TZ']
    utc_time = dup.gmtime
    ENV['TZ'] = to_zone
    to_zone_time = utc_time.localtime
    ENV['TZ'] = original_zone  # 戻す必要がある？→このスクリプトだけなら問題ないけど、こういう癖をつけた方がいいのだろう。
    return to_zone_time
  end
end

p t = Time.at(1000000000)
p t.convert_zone("US/Pacific")
p t.convert_zone("US/Alaska")
p t.convert_zone("UTC")
p t.convert_zone("Turkey")
p t.convert_zone("Asia/Calcutta") # インドは30分のオフセットを使用する(+0530)

p 'TZ環境変数を設定(でも以降の例はイマイチ何が言いたいのか分かりづらい)'
ENV['TZ'] = "Africa/Lagos"
p t = Time.at(1000000000)   # 環境変数が設定された状態で生成されるTimeオブジェクト
ENV['TZ'] = nil             # 元のローカルタイム(JST)に戻す
p t.convert_zone("Singapore")  # ちゃんとシンガポール時間
p t.convert_zone("US/Eastern") 

p '注意！ TZ環境変数はプロセスに対してグローバルなので、複数のスレッドで同時にタイムゾーンを変換しようとすると問題が起こる'

