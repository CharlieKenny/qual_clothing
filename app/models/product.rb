class Product < ActiveRecord::Base
  has_and_belongs_to_many :carts
  
  def add_to_cart
    self.quantity -= 1
    self.save
  end

  def remove_from_cart
    self.quantity += 1
    self.save
  end
end
