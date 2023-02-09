## How do we create an object in Ruby? Give an example of the creation of an object.

```
class MyClass
end

my_obj = MyClass.new
```

## What is a module? What is its purpose? How do we use them with our classes? Create a module for the class you created in exercise 1 and include it properly.

a Module is a collection of behaviors that is usable in other classes via mixins. The purpose is a way to add behaviors to existing classes.

```
module AddedBehavior
  def some_thing(parameter)
    # code
  end
end

class MyClass
  include AddedBehavior
end

my_obj = MyClass.new
```
