# If we have a Car class and a Truck class and we want to be able to go_fast, how can we add the ability for them to go_fast using the module Speed? How can you check if your Car or Truck can now go fast?

# First we need to include the Speed module in both Car and Truck classes. Then to check that both those classes now have access to the go_fast method from Speed, we instantiate a new Car class and a new Truck class and call the go_fast on those objects.

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  include Speed

  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

Car.new.go_slow
Truck.new.go_very_slow
Car.new.go_fast
Truck.new.go_fast
