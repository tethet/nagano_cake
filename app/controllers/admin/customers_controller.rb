class Admin::CustomersController < ApplicationController
  layout 'admin' 
  before_action :move_to_signed_in
  
  
  def index
    @customer = Customer.page(params[:page])
  end
  
  def show
    @customer = Customer.find(params[:id])
  end
  
  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customer_path(customer.id)
  end
  
  private
  def customer_params
    params.require(:customer).permit(:email, :last_name, :first_name,  :last_name_kana, 
                                     :first_name_kana,:postal_code, :address, :telephone_number)
  end
  
  def move_to_signed_in
    unless admin_signed_in?
    redirect_to  admin_session_path

    end
  end

end
