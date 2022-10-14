class Public::DeliveriesController < ApplicationController
  def index
    @address = Address.new
    @customer = current_customer
    @addresses = current_customer.addresses
  end
  
  def edit
    @customer = current_customer
    @address = Address.current_customer
  end
  
  def create
    @address = Address.new(address_params)
    @address.save
    redirect_to deliveries_path
  end
  
  def update
    
  end
  
  def destroy
  end
  
  private

  def address_params
     params.require(:address).permit(:postal_code, :address, :name)
  end
end
