class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.page(params[:page]).per(10)
  end

  def show
    @customer=Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end
end
