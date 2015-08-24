class Cart < ActiveRecord::Base
  has_and_belongs_to_many :products

  include PromocodeHelper


  def checkout
    self.total_price = 0
    items = self.products.map {|product| product.price }
     total = items.inject{|sum,x| sum + x }
     if self.discount == 0 || self.discount == nil
      self.total_price = total
    else
      self.total_price = total - self.discount
    end
  end

  def is_not_empty?
    self.products != []
  end

  def set_discount
    self.discount = 0
  end

  def apply_promocode(promocode)
    self.checkout
    if self.promo_validation(promocode)
       self.discount = self.promocodes[promocode]["discount"]
       self.save
    end
  end

  def promo_validation(promocode)
    if can_apply_promocode1? || can_apply_promocode2? || can_apply_promocode3?
      promo = self.promocodes.map {|key,value| key}
      promo.include?(promocode)
    end
  end

  def remove_promocode
    self.promocode = nil
    self.discount = 0
    self.save
  end
end