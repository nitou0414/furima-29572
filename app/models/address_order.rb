class AddressOrder
   include ActiveModel::Model
   attr_accessor :item_purchase_id,:post_code,:prefecture_id,:city,:address,:building_name,:phone_number,:user_id,:item_id,:token

   with_options presence: true do
    validates :post_code
    validates :prefecture_id
    validates :city
    validates :address
    validates :phone_number
    validates :user_id
    validates :item_id
    validates :token

   end

    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :phone_number, format: { with: /\A\d{10,11}\z/}
  
   def save
    # 各テーブルにデータを保存する処理を書く
    #購入情報の保存
    item_purchase= ItemPurchase.create(user_id: user_id, item_id: item_id)
    #住所情報の保存
    SendingDestination.create(item_purchase_id: item_purchase.id, post_code: post_code, prefecture_id: prefecture_id,
    city:city, address:address, building_name:building_name, phone_number:phone_number)
   end
end