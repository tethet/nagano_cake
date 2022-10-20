class OrderDetail < ApplicationRecord
  belongs_to :item 
  belongs_to :order
  enum makeing_status: { production_not_allowed: 0, waiting_for_production: 1, in_production: 2, completion_of_production: 3}
  
  def sub_total
   purchase_price * quantity
  end
  
  def with_tax_price
   (self.purchase_price * 1.1).round
  end
end
