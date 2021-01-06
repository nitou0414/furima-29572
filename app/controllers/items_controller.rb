class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [new]
  before_action :set_item, only: [:edit, :show]


  def index
    @items = Item.all.order('id DESC')
  end

  def new 
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
    redirect_to root_path
    else
      render :new
    end
  end

#  def edit
#  end

#  def show
#  end

#  def destroy
#   @items = Item.find(params[:id])
#     @items.destroy
#     redirect_to root_path
# end

#  def update
#    @item.update(item_params)
#    redirect_to root_path
#  end

 def set_item
  @item = Item.find(params[:id])
end

  private

def item_params
    params.require(:item).permit(:name, :image, :explanation, :category_id, :status_id, :shipping_charge_id, :prefecture_id, :shipping_date_id, :price).merge(user_id: current_user.id)
end
end