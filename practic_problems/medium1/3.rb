# The problem with updating attr_reader to attr_accessor, is that the instance variables both become changeable. This could pose a security risk where the variables name could be changed circumventing any protections built into the update_quantity method.

class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    quantity = updated_count if updated_count >= 0
  end
end
