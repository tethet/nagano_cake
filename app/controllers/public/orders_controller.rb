class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    # byebug
      
    @customer = current_customer
    @address = @customer.addresses
    
  end
  
  def confirmation
     @customer = current_customer
     @cart_items = @customer.cart_items
     @total = 0
     @order = Order.new(order_params)
     @postage = 800
     
     
  if params[:order][:select_address] == "0"
       @order.name = current_customer.first_name + current_customer.last_name
       @order.postal_code = current_customer.postal_code
       @order.address = current_customer.customer_address
  elsif params[:order][:address_number] == "1"
      @order.name = current_customer.first_name + current_customer.last_name
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
  else params[:order][:address_number] == "2" 
  end
  end
  
  def conpletion
  end
  
  def create
    cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new (order_params)
    @order.save
    redirect_to completion_path
    cart_items.destroy_all
  end
  
  def index
  end
  
  def show
  end
  
  private

  def order_params
    params.require(:order).permit(:name, :address, :postal_code,  :total_payment, :postage, :payment_method)
  end

  def address_params
    params.require(:order).permit(:name, :address, :postal_code)
  end
  
end
