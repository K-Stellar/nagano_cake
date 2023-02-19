class Public::CustomersController < ApplicationController
  def show
  end

  def edit
  end

  def check
  end

  def withdrawal
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "ご利用ありがとうございました"
    redirect_to root_path
  end






end
