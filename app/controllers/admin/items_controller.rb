class Admin::ItemsController < ApplicationController
  layout 'admin'
  
  def index
    @item = Item.page(params[:page])
    
  end
  
  def new
  end
  
  def create
  end
  
  def show
  end
  
  def edit
  end
  
  def update 
  end
end
