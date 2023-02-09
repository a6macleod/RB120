# Using the class definition from step #3, let's create a few more people -- that is, Person objects.

# If we're trying to determine whether the two objects contain the same name, how can we compare the two objects?

class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    determine_name(full_name)
  end

  def name
    (@first_name + ' ' + @last_name).strip
  end

  def name=(full_name)
    determine_name(full_name)
  end

  private

  def determine_name(full_name)
    parts = full_name.split
    self.first_name = parts.first
    self.last_name = parts.size > 1 ? parts.last : ''
  end
end

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

p bob.name
p rob.name
p bob.name == rob.name
