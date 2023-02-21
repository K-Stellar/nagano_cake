class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  
  def show
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customers_path
    else
      redirect_to request.referer
    end
  end

  def check
  end

  def withdrawal
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    flash[:thank_you] = "ご利用ありがとうございました"
    redirect_to root_path
  end



  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_num, :email)
  end

end
