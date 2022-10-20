class Admin::HomesController < ApplicationController
  layout 'admin'
  before_action :move_to_signed_in
  
  def top
    @orders = Order.page(params[:page])
  end
  
private
  def move_to_signed_in
    unless admin_signed_in?
    redirect_to  admin_session_path

    end
  end
end
