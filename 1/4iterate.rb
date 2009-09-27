# -*- coding: utf-8 -*-
require 'date'
(Date.new(1776, 7, 2)..Date.new(1776, 7, 4)).each { |x| puts x }

span = DateTime.new(1776, 7, 2, 1, 30, 15)..DateTime.new(1776, 7, 4, 7, 0, 0)
span.each { |x| puts x}

(Time.at(100)..Time.at(102)).each{ |x| puts x }

the_first = Date.new(2004, 1, 1)
the_fifth = Date.new(2004, 1, 5)

the_first.upto(the_fifth){ |x| puts x }

# Timeオブジェクトには stepやuptoが定義されていないが、追加するのは簡単
class Time
  def step(other_time, increment)
    raise ArgumentError, "step can't be 0" if increment == 0
    increasing = self < other_time
    p "increasing = #{increasing}"
    p "increment = #{increment}"
    p "self = #{self}"
    if ( increasing && increment < 0 ) || (!increasing && increment > 0)
      yield self
      return
    end
    d = self
    begin
      yield d
      d += increment
    end while (increasing ? d <= other_time : d >= other_time)
  end

  def upto(other_time)
    # step(other_time, 1){ |x| yield x } # 本の例だと細かすぎるので
    step(other_time, 60 * 60 * 24){ |x| yield x}
  end
end

the_first  = Time.local(2004, 1, 1)
the_second = Time.local(2004, 1, 2)
the_first.step(the_second, 60 * 60 * 6){ |x| puts x}
the_first.upto(the_second){ |y| puts y}
