require 'set'

module Taggable
  attr_accessor :tags
  
  def taggable_setup
    @tags = Set.new
  end

  def add_tag(tag)
    @tags << tag
  end

  def remove_tag(tag)
    @tags.delete(tag)
  end
end

class TaggableString < String
  include Taggable
  def initialize(*args)
    super
    taggable_setup
  end
end

s = TaggableString.new('It was the best of times, it the worst of times.')
s.add_tag('dickens')
s.add_tag('quatation')
p s.tags

module Complaint
  def gripe
    voice('In all my years I have never encountered such behavior...')
  end

  def faint_praise
    voice('I am pleased to notice some improvement, however slight...')
  end

  def voice(complaint_text)
    raise NotImplementedError,
    "#{self.class} included the Complaint module but didn't define voice!"
  end
end

class MyComplaint
  include Complaint
end

# MyComplaint.new.gripe

module Ayto
  def potato
    'Pohtayto'
  end
end

module Ahto
  def potato
    'Pohtahto'
  end
end

class Potato
  include Ayto
  include Ahto
end
p Potato.new.potato 

# >> #<Set: {"quatation", "dickens"}>
# >> "Pohtahto"
