require 'rails_helper'

RSpec.describe ItemPurchase, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @item_purchase = FactoryBot.build(:item_purchase,user_id: user.id,item_id: item.id)
    # @item_purchase = FactoryBot.build(:item_purchase)
  end

  describe '商品購入登録' do
    context '商品購入がうまくいくとき' do
      it "item_id,user_idが存在すれば登録できる" do
        expect(@item_purchase.valid?).to eq true
      end
    end
  end

  context '商品購入がうまくいかないとき' do
    it "item_idが空だと登録できない" do
      @item_purchase.item_id = ''
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include("Item must exist")
      end
    it "user_idが空だと登録できない" do
      @item_purchase.user_id = ''
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include("User must exist")
      end
    end
  end
