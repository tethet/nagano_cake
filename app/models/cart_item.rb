class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer
  
  def sub_total
    item.with_tax_price * amount
  end
end
