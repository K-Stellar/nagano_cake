class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.page(params[:page]).per(10)
  end

  def show
  end

  def edit
    @customer = Customer.find(params[:id])
  end
end
