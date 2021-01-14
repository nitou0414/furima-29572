FactoryBot.define do
  factory :address_order do
    item_purchase_id   {1}
    post_code          {"000-0000"}  
    prefecture_id      {1}  
    city               {"新宿区"}
    address            {"新宿1-1-1"}
    building_name      {"新宿ビル"}
    phone_number       {"00000000000"}
    token              {"tok_abcdefghijk00000000000000000"}
  end
end
