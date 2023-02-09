# What will the following code print?

class Something
  def initialize
    @data = 'Hello'
  end

  def dupdata
    @data + @data
  end

  def self.dupdata
    'ByeBye'
  end
end

thing = Something.new
puts Something.dupdata # => 'ByeBye' because this is the class method being called
puts thing.dupdata # =. 'HelloHello' because this is the instance method being called. which uses the initialized instance variable.
