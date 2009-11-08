module MyLib
  module ClassMethods
    def class_method
      puts "This method was first defined in MyLib::ClassMethods"
    end
  end

  def self.included(receiver)
    puts "MyLib is being included in #{receiver}!" #なぜかreceiverにはself.classが入る
    receiver.extend(ClassMethods) #次にここでClassMethodsを呼び出す
  end
end

class MyClass
  include MyLib #最初に呼び出す
end
MyClass.class_method
# >> MyLib is being included in MyClass!
# >> This method was first defined in MyLib::ClassMethods
