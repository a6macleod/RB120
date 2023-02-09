#  There actually is no difference between these two classes on how the show_template method uses the template and self.template variable. These both access the getter method created with attr_accessor. However, per the Ruby style guide self should only be used where necessary.

class Computer1
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end

class Computer2
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    self.template
  end
end

comp1 = Computer1.new
comp1.create_template
puts comp1.show_template
comp2 = Computer2.new
comp2.create_template
puts comp2.show_template
