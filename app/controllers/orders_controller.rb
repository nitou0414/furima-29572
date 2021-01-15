class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]

  def index
    if @item.item_purchase.present?
      redirect_to root_path
    else
      redirect_to root_path
    end
    @address_order = AddressOrder.new
  end

  def create
    @address_order = AddressOrder.new(address_order_params)
    if @address_order.valid?
     pay_item
     @address_order.save
     redirect_to root_path
    else
     render "index" 
    end
  end
  
  private
  def address_order_params
    params.require(:address_order).permit(:item_purchase_id,:post_code,:prefecture_id,:city,:address,:building_name,:phone_number,:item_id).merge(token: params[:token], user_id: current_user.id, item_id: @item.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: address_order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end

end
