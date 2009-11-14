module Timeable
  attr_reader :time_created

  def initialize
    @time_created = Time.now
  end

  def age
    Time.now - @time_created
  end
end

class Character
  include Timeable
  attr_reader :name
  def initialize( name )
    @name = name
    super() # Timeableのinitializeを呼び出す
  end
end

c = Character.new "Fred"
p c.time_created
p c.age
sleep 1
p c.age

# Characterの祖先は？
p Character.ancestors
# >> Sat Nov 14 20:32:43 +0900 2009
# >> 0.000504
# >> 1.000709
# >> [Character, Timeable, Object, Kernel]
