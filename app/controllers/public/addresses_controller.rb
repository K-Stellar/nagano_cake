class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = Address.all
  end

  def edit
  end
  
  def create
    @address=Address.new(address_params)
    @address.customer_id = current_customer.id
    @address.save
    redirect_to request.referer
  end
  
  def destroy
    address = Address.find(params[:id])
    address.delete
    redirect_to request.referer
  end
  
  private
  
  def address_params
    params.require(:address).permit(:name, :address, :postal_code)
  end
end
