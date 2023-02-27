class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
   @orders = Order.page(params[:page]).order(created_at: :desc).per(10)

  end
end
