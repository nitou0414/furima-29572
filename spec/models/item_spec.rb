require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品登録' do
    context '商品登録がうまくいくとき' do
      it "nameとexplanation、category_idとstatus_id,shipping_charges_id,prefecture_id,shipping_date_id,priceとitem_image,user_idが存在すれば登録できる" do
        expect(@item.valid?).to eq true
      end
    end
  end

     context '商品登録がうまくいかないとき' do
       it "nameが空だと登録できない" do
         @item.name = ''
         @item.valid?
         expect(@item.errors.full_messages).to include("Name can't be blank")
         end
       it "explanationが空だと登録できない" do
         @item.explanation = ''
         @item.valid?
         expect(@item.errors.full_messages).to include("Explanation can't be blank")
         end
      it "category_idが空だと登録できない" do
        @item.category_id = ''
        @item.valid?
         expect(@item.errors.full_messages).to include("Category can't be blank")
        end
      it "status_idが空だと登録できない" do
        @item.status_id = ''
        @item.valid?
          expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it "shipping_charges_idが空だと登録できない" do
        @item.shipping_charges_id = ''
        @item.valid?
          expect(@item.errors.full_messages).to include("Shipping charges can't be blank")
      end        
      it "prefecture_idが空だと登録できない" do
        @item.prefecture_id = ''
        @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "shipping_date_idが空だと登録できない" do
        @item.shipping_date_id = ''
        @item.valid?
          expect(@item.errors.full_messages).to include("Shipping date can't be blank")
      end
      it "priceが空だと登録できない" do
        @item.price = ''
        @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが半角数値以外だと登録できない" do
        @item.price = '１１１'
        @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "imageが空だと登録できない" do
        @item.image = nil
        @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
      end
  end
