class Admin::HomesController < ApplicationController
  layout 'admin'
  
  def top
    @order = Order.all
  end
end
