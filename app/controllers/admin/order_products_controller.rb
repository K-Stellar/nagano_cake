class Admin::OrderProductsController < ApplicationController
  before_action :authenticate_admin!
end
