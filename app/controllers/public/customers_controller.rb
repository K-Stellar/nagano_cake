class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find_by(params[:id])
  end

  def edit
  end

  def check
  end






end
