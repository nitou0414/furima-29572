class ItemsController < ApplicationController
  #authenticate_user!=ログインしていなかったら
  before_action :authenticate_user!, except: [:index, :show]
  #set_〇〇=まとめる
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  #only=全て
  #except=それ以外

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

  def edit
    if current_user.id != @item.user_id 
      redirect_to root_path
    end
  end

  def update
    if current_user.id == @item.user_id
      @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    if current_user.id == @item.user_id
    @item.destroy
    redirect_to root_path
    else
     render :edit
    end
  end

  private

  def item_params
      params.require(:item).permit(:name, :image, :explanation, :category_id, :status_id, :shipping_charge_id, :prefecture_id, :shipping_date_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end