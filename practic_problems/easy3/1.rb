class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# What happens in each of the following cases:
hello = Hello.new
hello.hi # => hi is invoked which calls greet('hello') which will print 'Hello'

hello = Hello.new
# hello.bye # => An undefined method error will be raised

hello = Hello.new
# hello.greet # => An argument error will be raised because we didn't pass a parameter to the greet method

hello = Hello.new
hello.greet("Goodbye") # => the greet method is called directly and passed a parameter so it will print out "Goodbye"

Hello.hi # => the hi method is called on the Hello class and an undefined method error will be raised
