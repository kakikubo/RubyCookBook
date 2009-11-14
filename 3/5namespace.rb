module StringTheory
  class String
    def initialize(length=10**-33)
      @length = length
    end
  end
end

p String.new
p StringTheory::String.new

module StringTheory2
  # Stringを使用したい場合は問題につながる可能性があるので予め変数に入れておく
  RubyString = String
  class String
    def initialize(length=10**-33)
      @length = length
    end
  end
  RubyString.new("This is a built-in string, not a StringTheory2::String")
end
# >> ""
# >> #<StringTheory::String:0x1001a6b38 @length=1.0e-33>
# >> #<StringTheory2::String:0x1001a6a20 @length=1.0e-33>
