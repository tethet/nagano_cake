class Admin::OrdersController < ApplicationController
  layout 'admin'
   before_action :move_to_signed_in
  
  def show
    @order = Order.find(params[:id])
  end
  
  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path(order.id)
  end
  
  private
  
  def move_to_signed_in
    unless admin_signed_in?
    redirect_to  admin_session_path

    end
  end
 
end
