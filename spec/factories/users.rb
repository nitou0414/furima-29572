FactoryBot.define do
  factory :user do
    name              {Faker::Name.initials(number: 2)}
    email                {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password              {password}
    password_confirmation {password}
    family_name           {"あア阿"}
    first_name            {"あア阿"}
    family_name_kana           {"フリマ"}
    first_name_kana            {"タロウ"}
    birth_day             {'1990-01-02'}
  end
end