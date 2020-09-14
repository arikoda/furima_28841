FactoryBot.define do
  factory :order_address do
    postal_code { '555-3454' }
    origin_area_id { Faker::Number.within(range: 2..48) }
    prefecture { Faker::Address.city_prefix }
    home_number { Faker::Number.within(range: 1..300) }
    building_number { Faker::Address.building_number }
    telephone { Faker::Number.leading_zero_number(digits: 11) }
    token { ENV['PAYJP_SECRET_KEY'] }
  end
end
