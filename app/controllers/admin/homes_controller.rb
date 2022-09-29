class Admin::HomesController < ApplicationController
  layout 'admin'
  
  def top
    @order = Order.page(params[:page])
  end
end
