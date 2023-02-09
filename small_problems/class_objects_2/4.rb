# Using the following code, add two methods: ::generic_greeting and #personal_greeting. The first method should be a class method and print a greeting that's generic to the class. The second method should be an instance method and print a greeting that's custom to the object.

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def self.generic_greeting
    'Hello! from generic greeting'
  end

  def personal_greeting
    "Hello #{name}"
  end
end

kitty = Cat.new('Sophie')

p Cat.generic_greeting
p kitty.personal_greeting
