FactoryBot.define do
  factory :item do
    name                 {"名前"}  
    explanation          {"説明"}
    category_id          {1}
    status_id            {1}
    shipping_charges_id  {1}
    prefecture_id        {1}
    shipping_date_id     {1}
    price                {1111}
    image                {'/Users/n_itou/projects/furima-29572/app/assets/images/item-sample.png'}
    
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('/Users/n_itou/projects/furima-29572/app/assets/images/item-sample.png'), filename: 'item-sample.png')
    end
  end
end
