# What could you add to this class to simplify it and remove two methods from the class definition while still maintaining the same functionality?

# The two functions that can be removed are the getter and setter methods type and type=. These can be replaced with the attr_accessor and the symbol :type

class BeesWax
  attr_accessor :type
  def initialize(type)
    @type = type
  end

  # def type
  #   @type
  # end

  # def type=(t)
  #   @type = t
  # end

  def describe_type
    puts "I am a #{type} of Bees Wax"
  end
end

wax = BeesWax.new("hair")
wax.type = "bees"
p wax.type
wax.describe_type
