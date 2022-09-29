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
    @item.save!
    redirect_to admin_items_path
  end
  
  def show
   @item = Item.find(params[:id])
  end
  
  def edit
   @item = Item.find(params[:id])
  end
  
  def update 
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_items_path
  end
  
private


  def item_params
    params.require(:item).permit(:name, :explanation, :price_without_tax, :item_status, :image, :genre_id)
  end
 

end
