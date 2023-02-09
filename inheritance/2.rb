class Animal
  def speak
    'growl!'
  end

  def swim
    'swimming!'
  end

  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < Animal
  def speak
    'bark!'
  end

  def fetch
    'fetching!'
  end
end

class Cat < Animal
  def speak
    'Meow!'
  end

  def swim
    "Won't swim"
  end
end

animal = Animal.new
p animal.speak
sparky = Dog.new
p sparky.speak
gus = Cat.new
p gus.speak
