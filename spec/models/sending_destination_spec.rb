require 'rails_helper'

RSpec.describe AddressOrder, type: :model do
  before do
    item = FactoryBot.create(:item)
    sleep 1
    user = FactoryBot.create(:user)
    @address_order = FactoryBot.build(:address_order,item_id: item.id,user_id: user.id)
  end

  describe '商品購入登録' do
    context '商品購入がうまくいくとき' do
      it "item_purchase_id,post_code,prefecture_id,city,address,phone_number,token,item_id,user_idが存在すれば登録できる" do
        expect(@address_order.valid?).to eq true
      end
      it "building_nameが空でも登録できる" do
        expect(@address_order.valid?).to eq true
      end
    end

  context '商品登録がうまくいかないとき' do
    it "post_codeが空だと登録できない" do
      @address_order.post_code = ''
      @address_order.valid?
      expect(@address_order.errors.full_messages).to include("Post code can't be blank")
      end
    it "post_codeにはハイフンが無いと登録できない" do
      @address_order.post_code = '0000000'
      @address_order.valid?
      expect(@address_order.errors.full_messages).to include("Post code is invalid")
      end
    it "prefecture_idが空だと登録できない" do
      @address_order.prefecture_id = ''
      @address_order.valid?
      expect(@address_order.errors.full_messages).to include("Prefecture can't be blank")
      end
    it "prefecture_idが選択されていない状態「---」では登録できない" do
      @address_order.prefecture_id = nil
      @address_order.valid?
      expect(@address_order.errors.full_messages).to include("Prefecture can't be blank")
      end
    it "cityが空だと登録できない" do
      @address_order.city = ''
      @address_order.valid?
      expect(@address_order.errors.full_messages).to include("City can't be blank")
      end
    it "addressが空だと登録できない" do
      @address_order.address = ''
      @address_order.valid?
      expect(@address_order.errors.full_messages).to include("Address can't be blank")
      end
    it "phone_numberが空だと登録できない" do
      @address_order.phone_number = ''
      @address_order.valid?
      expect(@address_order.errors.full_messages).to include("Phone number can't be blank")
      end
    it "phone_numberにはハイフンは不要で、11桁以内でないと登録できない" do
      @address_order.phone_number = nil
      @address_order.valid?
      expect(@address_order.errors.full_messages).to include("Phone number is invalid")
      end
    it "phone_numberは英数混合では登録できない" do
      @address_order.phone_number = 'abc11111111'
      @address_order.valid?
      expect(@address_order.errors.full_messages).to include("Phone number is invalid")
      end
    it "tokenが空だと登録できない" do
      @address_order.token = ''
      @address_order.valid?
      expect(@address_order.errors.full_messages).to include("Token can't be blank")
      end
    it "item_idが空だと登録できない" do
      @address_order.item_id = ''
      @address_order.valid?
      expect(@address_order.errors.full_messages).to include("Item can't be blank")
      end
    it "user_idが空だと登録できない" do
      @address_order.user_id = ''
      @address_order.valid?
      expect(@address_order.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end