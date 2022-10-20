class Public::AddressesController < ApplicationController
  before_action :move_to_signed_in
  
  def index
    @address = Address.new
    @customer = current_customer
    @addresses = current_customer.addresses
  end
  
  def edit
    @customer = current_customer
    @address = Address.find(params[:id])
  end
  
  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @address.save
    redirect_to addresses_path
  end
  
  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to addresses_path
  end
  
  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end
  
  private

  def address_params
     params.require(:address).permit(:postal_code, :address, :name)
  end
  
  def move_to_signed_in
    unless admin_signed_in?
    redirect_to  top_path

    end
  end
end
