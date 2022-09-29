class Order < ApplicationRecord
  has_many :order_details
  belongs_to :customer
  
  enum payment_method: { credit_card:0, transfer:1 }
  enum order_status: { waiting_for_payment:0, payment_confirmation:1, production:2, shipping_preparation:3, sent:4 }
end
