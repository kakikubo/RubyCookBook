# factoryメソッド
def times_n(n)
  lambda { |x| x * n }
end

times_ten = times_n(10)
p times_ten.call(5)
p times_ten.call(1.25)

circumference = times_n(2 * Math::PI) # π => 3.14が入る。
p circumference.call(10)
p circumference.call(3)
p [1,2,3].collect(&circumference)

ceiling = 50
# 次の数値のうち、ターゲットよりも小さいものはどれか。
p [1, 10, 49, 50.1, 200].select { |x| x < ceiling }
# >> 50
# >> 12.5
# >> 62.8318530717959
# >> 18.8495559215388
# >> [6.28318530717959, 12.5663706143592, 18.8495559215388]
# >> [1, 10, 49]
