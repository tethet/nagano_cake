class Public::OrdersController < ApplicationController
  before_action :move_to_signed_in
  
  
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
       @order.address = current_customer.address
  elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.name = @address.name
      @order.postal_code = @address.postal_code
      @order.address = @address.address
  else params[:order][:select_address] == "2" 
  end
  end
  
  def conpletion
  end
  
  def create
    cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    @order.save
    cart_items.each do |cart_item|
      order_detail = OrderDetail.new
      order_detail.item_id = cart_item.item.id
      order_detail.order_id = @order.id
      order_detail.quantity = cart_item.amount
      order_detail.purchase_price = cart_item.item.price_without_tax
      order_detail.save
    end
    redirect_to completion_path
    cart_items.destroy_all
  end
  
  def index
    @orders = current_customer.orders
    @customer = current_customer
  end
  
  def show
    # @orders = current_customer.orders
     @order = Order.find(params[:id])
     @order_details = @order.order_details
     @total = 0
     @postage = 800
  end
  
  private

  def order_params
    params.require(:order).permit(:name, :address, :postal_code, :total_payment, :postage, :payment_method)
  end

  def address_params
    params.require(:order).permit(:name, :address, :postal_code)
  end
  
  def move_to_signed_in
    unless customer_signed_in?
    redirect_to  top_path

    end
  end
  
end
