class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find_by(params[:id])
  end

  def edit
  end

  def check
  end





  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_num)
  end


end
