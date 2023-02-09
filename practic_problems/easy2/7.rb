# Explain what the @@cats_count variable does and how it works. What code would you need to write to test your theory?

# the @@cats_count varible increments everytime a new instance of the Cat method is instantiated. The method is a class method. To test this, we would need to instantiate a Cat class object and then call the class method Cat.cats_count to return the @@cats_count class variable

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

a = Cat.new('grey')
p Cat.cats_count
b = Cat.new('grey')
p Cat.cats_count
c = Cat.new('grey')
p Cat.cats_count
