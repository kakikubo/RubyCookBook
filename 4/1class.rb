p 'a string'.class             # String
p 'a string'.class.name        # "String"
p 'a string'.class.superclass  # Object
p String.superclass            # Object
p String.class                 # Class
p String.class.superclass      # Module
p 'a string'.class.new         # ""

class Class
  def hierarchy
    (superclass ? superclass.hierarchy : []) << self
  end
end
p Array.hierarchy

class MyArray < Array
end
p MyArray.hierarchy
# >> String
# >> "String"
# >> Object
# >> Object
# >> Class
# >> Module
# >> ""
# >> [Object, Array]
# >> [Object, Array, MyArray]
