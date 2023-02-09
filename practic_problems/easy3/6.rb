class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    # self.age += 1
    # age += 1 #THIS DOESN"T WORK
    @age += 1
  end
end

# In the make_one_year_older method we have used self. What is another way we could write this method so we don't have to use the self prefix?
# replacing the self with @ will reference the instance variable

tom = Cat.new("tabby")
p tom.age
tom.make_one_year_older
tom.make_one_year_older
tom.make_one_year_older
p tom.age
