class Admin::ItemsController < ApplicationController
  layout 'admin'
  
  def index
    @item = Item.page(params[:page])
    
  end
  
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    @item.admin_id = current_admin.id
    @item.save
    redirect_to admin_items_path
  end
  
  def show
   @item = Item.find(params[:id])
  end
  
  def edit
  end
  
  def update 
  end
  
private


  def item_params
    params.require(:item).permit(:name, :explanation, :price_without_tax, :item_status, :image)
  end
 

end
