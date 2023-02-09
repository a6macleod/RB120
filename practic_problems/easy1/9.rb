# If we have the class below, what would you need to call to create a new instance of this class.

class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

# you would need to pass the arguments for color and material to initialize a new instance of the Bag class

backpack = Bag.new('Black', 'Nylon')
p backpack
