class Admin::OrderDetailsController < ApplicationController
  layout 'admin'
  
  def update
    @order_detail = Order.find(params[:id])
    @order_detail.update(order_params)
     redirect_to admin_order_path(order.id)
  end
end
