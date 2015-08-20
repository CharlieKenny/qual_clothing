class Cart < ActiveRecord::Base
  has_and_belongs_to_many :products

  def total_price
    items = Cart.first.products.map {|product| product.price }
    total = items.inject{|sum,x| sum + x }
    
  end

end
