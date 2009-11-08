class Person
  attr_reader :name, :age, :occupation

  def initialize(name, age, occupation)
    @name, @age, @occupation = name, age, occupation
  end

  def mild_mannered?
    true
  end
end

jimmy = Person.new('Jimmy Olsen', 21, 'cub reporter')
clark = Person.new('Clark Kent', 35, 'reporter')
jimmy.mild_mannered? # true
clark.mild_mannered? # true

module SuperPoweres
  def fly
    'Flying!'
  end

  def leap(what)
    "Leaping #{what} in a single bound!"
  end

  def mild_mannered?
    false
  end

  def superhero_name
    'Superman'
  end
end

p clark.extend(SuperPoweres)
p clark.superhero_name
p clark.fly
p clark.mild_mannered?
p jimmy.mild_mannered?

# >> #<Person:0x1001a59e0 @name="Clark Kent", @occupation="reporter", @age=35>
# >> "Superman"
# >> "Flying!"
# >> false
# >> true
