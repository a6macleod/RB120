class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# What would happen if I called the methods like shown below?

tv = Television.new
tv.manufacturer # => undefined method error
tv.model # => the model methods information for the tv object is returned

Television.manufacturer # => the class method manufacturer would return its information associated wtih the class
Television.model # => an undefined method error is returned
