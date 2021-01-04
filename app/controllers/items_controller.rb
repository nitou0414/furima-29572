class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :show]
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.all.order('id DESC')
  end

  def new 
    @item = Item.new
  end

  def create
    @item=Item.new(item_params)
    if @item.save
    redirect_to root_path
    else
      render :new
    end
  end

def edit
end

# def update
#   @item.update(item_params)
#   redirect_to root_path
# end

  private

def item_params
    params.require(:item).permit(:name, :image, :explanation, :category_id, :status_id, :shipping_charges_id, :prefecture_id, :shipping_date_id, :price).merge(user_id: current_user.id)
end

def move_to_index
      unless user_signed_in?
        redirect_to action: :index
    end
    end
  end