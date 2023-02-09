# Which of these two classes would create objects that would have an instance variable and how do you know?

# The Pizza class will create an instance variable. I can tell by the @name instance variable being initialized when the Pizza object is initialized.

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

hot_pizza = Pizza.new("cheese")
orange    = Fruit.new("apple")

p hot_pizza.instance_variables
# => [:@name]
p orange.instance_variables
# => []
