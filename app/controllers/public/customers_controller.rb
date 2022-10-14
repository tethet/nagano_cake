class Public::CustomersController < ApplicationController
  def show
   @customer = current_customer
  end
  
  def edit
    @customer = current_customer
  end
  
  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to customer_path(current_customer)
  end
  
  def exit
    @customer = current_customer
  end
  
  def period
    @customer = current_customer
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @customer.update(is_deleted: true)
    reset_session
    # flash[:notice] = "退会処理を実行いたしました"
    
    redirect_to top_path
    
  end
  private

  def customer_params
     params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :is_deleted)
  end
end
