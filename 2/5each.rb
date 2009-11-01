class Tree
  attr_reader :value
  def initialize(value)
    @value = value
    @children = []
  end

  def <<(value)
    subtree = Tree.new(value)
    @children << subtree
    return subtree
  end
  
  def each
    yield value
    @children.each do |child_node|
      child_node.each { |e| yield e}
    end
  end
end

t = Tree.new("Parent")
child1 = t << "Child 1"
child1 << "Grand Child 1.1"
child1 << "Grand Child 1.2"
child2 = t << "Child 2"
child2 << "Grand Child 2.1"
t.each{ |x| puts x }

class Array
  def each_from_both_sides()
    front_index = 0
    back_index = self.length - 1
    while front_index <= back_index
      yield self[front_index]
      front_index += 1
      if front_index <= back_index
        yield self[back_index]
        back_index -= 1
      end
    end
  end
end
%w{ Curses! been again! foiled Ive}.each_from_both_sides{|x| puts x}

module Enumerable
  def each_n_times(n)
    each { |e| n.times{ yield e} }
  end
  
  def each_randomly
    (sort_by { rand }).each{ |e| yield e}
  end
end

%w{Hello Echo}.each_n_times(3){ |x| puts x}
%w{Eat at Joes}.each_randomly{ |x| puts x}
# >> Parent
# >> Child 1
# >> Grand Child 1.1
# >> Grand Child 1.2
# >> Child 2
# >> Grand Child 2.1
# >> Curses!
# >> Ive
# >> been
# >> foiled
# >> again!
# >> Hello
# >> Hello
# >> Hello
# >> Echo
# >> Echo
# >> Echo
# >> Joes
# >> at
# >> Eat
