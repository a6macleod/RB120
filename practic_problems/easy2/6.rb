# Which one of these is a class method (if any) and how do you know? How would you call a class method?

# the method that has self in the name is a class variable. You call it just as you would anyother method, but you call it directly on the class itself not an instance of the class

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end
