# the error in the update_quantity method is that a new local varaible will be created called quantity. This is not referencing the instance variable @quantity. To update this, we would need to use, @quantity or change attr_reader to attr_accessor to create a setter method and refrence with self.quantity.

class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    quantity = updated_count if updated_count >= 0
  end
end
