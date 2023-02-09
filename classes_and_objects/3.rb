# Now create a smart name= method that can take just a first name or a full name, and knows how to set the first_name and last_name appropriately.

class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    determine_name(full_name)
  end

  def name
    (@first_name + ' ' + @last_name).strip
  end

  def name=(full_name)
    determine_name(full_name)
  end

  private

  def determine_name(full_name)
    parts = full_name.split
    self.first_name = parts.first
    p "Debug: #{parts.last}"
    self.last_name = parts.size > 1 ? parts.last : ''
  end
end

bob = Person.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
bob.last_name = 'Smith'
p bob.name                  # => 'Robert Smith'

bob.name = "John Adams"
p bob.first_name            # => 'John'
p bob.last_name             # => 'Adams'
