# How do you find where Ruby will look for a method when that method is called? How can you find an object's ancestors?

# You can find an objects ancestors by calling #ancestors on the class itself

module Taste
  def flavor(flavor)
    puts "#{flavor} module had it first"
  end
end

class Food
  def flavor(flavor)
    puts "#{flavor} is for food!"
  end
end

class Orange < Food
  # include Taste
end

class HotSauce
  include Taste
end

p HotSauce.ancestors
p Orange.ancestors
flav = Orange.new
flav.flavor('yumsco')
hot = HotSauce.new
hot.flavor('spicy')
# What is the lookup chain for Orange and HotSauce?
# Orange -> Taste -> Object -> Kernel -> BasicObject
# HotSauce -> Taste -> Object -> Kernel -> BasicObject
