class Admin::OrderProductsController < ApplicationController
  before_action :authenticate_admin!
  
  def update
    @order_product=OrderProduct.find(params[:id])
    @order=Order.find(@order_product.order_id)
    @order_products=@order.order_products.all
    is_update=true
    if @order_product.update(order_product_params)
      @order.update(status: 2) if @order_product.makig_status == "製作中"
      # 制作ステータスが「制作中」のときに、注文ステータスを「制作中」に更新する。
      @order_products.each do |order_product| #紐づいている注文商品の制作ステータスを一つ一つeach文で確認していく。
        if order_product.makig_status != "製作完了" #制作ステータスが「制作完了」ではない場合
          is_update = false #上記で定義したアップデートする記述をfalseにする(下記で使用)
        end
      end
      @order.update(status: 3) if is_update
      # is_updateがtrueの場合に、注文ステータスが「発送準備中に更新される。
    end
      redirect_to request.referer
  end
  
  def order_product_params
    params.require(:order_product).permit(:makig_status)
  end
end
