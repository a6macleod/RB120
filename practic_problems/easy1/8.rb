# If we have a class such as the one below:

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

# In the name of the cats_count method we have used self. What does self refer to in this context?

# this denotes the method as a class method. This is scoped to the Cat class and is shared by all instances of the Cat class. Inside of this method is a class variable. The Self points to the class itself.
