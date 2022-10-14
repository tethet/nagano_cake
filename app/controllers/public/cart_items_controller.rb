class Public::CartItemsController < ApplicationController
  def index
     @customer = current_customer
     @cart_items = @customer.cart_items
    # @item = Item.find(params[:item_id])
     @total = 0
  end
  
  def update
     @customer = current_customer
     @cart_item = @customer.cart_items
     @cart_item.update
     redirect_to cart_items_path
  end
  
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end
  
  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to top_path
  end
  
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    # binding.pry
    @cart_item.save!
    redirect_to cart_items_path
    
  end
  
  private
  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :amount, :item_id)
  end
end
