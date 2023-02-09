# Write a class that will display:
# ABC
# xyz

class Transform
  def initialize(my_string)
    @my_string = my_string
  end

  def uppercase
    @my_string.upcase
  end

  def self.lowercase(str)
    str.downcase
  end
end

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')
