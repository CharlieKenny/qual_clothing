module PromocodeHelper


  PROMOCODES = {'Promocode1' => {'description' => '£5 off', 'discount' => 5, 'qualifying purchase' => '', 'minimum spend' => 5}, 'Promocode2' =>  {'description' => '£10 off when you spend £50', 'discount' => 10, 'qualifying purchase' => '', 'minimum spend' => 50}, 'Promocode3' => {'description' => '£15 off when buy a pair of shoes and spend over £75', 'discount' => 15, 'qualifying purchase' => 'Footwear', 'minimum spend' => 50}}

  def promocodes
    PROMOCODES
  end

  def discount_applied?
    if self.discount.nil? || self.discount == 0
      return false
    else
      return true
    end
  end

  def can_apply_promocode1?
    if self.discount_applied? == false && self.total_price >= 5
      return true
    end
  end

  def can_apply_promocode2?
    if self.discount_applied? == false && self.total_price >= 50
      return true
    end
  end

  def can_apply_promocode3?
    category = self.products.map {|product| product.category}
    if self.discount_applied? == false
       self.total_price >= 75
       category.include?(self.promocodes["Promocode3"]["qualifying purchase"])
      return true
    end
  end
end