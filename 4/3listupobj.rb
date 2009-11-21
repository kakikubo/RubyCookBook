class Object
  def my_methods_only
    my_super = self.class.superclass
    return my_super ? methods - my_super.instance_methods : methods
  end
end

s = ''
p s.methods.size
p Object.instance_methods.size
p s.my_methods_only.size
p (s.methods - Object.instance_methods).size # !> (...) interpreted as grouped expression

def s.singleton_method()
# 一つ定義したもので…。
end

p s.methods.size # ここでの結果はひとつ増える
p s.my_methods_only.size # ここもひとつ増える

class Object
  def new_object_method
  end
end
 
p s.methods.size # new_object_methodを定義したからまたひとつプラス
p s.my_methods_only.size # でもmy_methods_onlyでは増えない

class MyString < String
  def my_string_method
  end
end
p  MyString.new.my_methods_only

# ここのあたりはまだよくわかっていないFIXME
class Object
  def my_methods_only_no_mixins
    self.class.ancestors.inject(methods) do |mlist, ancestor|
      mlist = mlist - ancestor.instance_methods unless ancestor.is_a? Class
      mlist
    end
  end
end

p [].methods.size
p [].my_methods_only.size
p [].my_methods_only_no_mixins.size
# >> 177
# >> 46
# >> 131
# >> 131
# >> 178
# >> 132
# >> 179
# >> 132
# >> ["my_string_method"]
# >> 152
# >> 104
# >> 64
