FactoryBot.define do
  factory :item do
    name { Faker::Name.initials }
    category_id { Faker::Number.within(range: 2..11) }
    shipping_charge_id { Faker::Number.within(range: 2..3) }
    origin_area_id { Faker::Number.within(range: 2..48) }
    send_day_id { Faker::Number.within(range: 2..4) }
    condition_id { Faker::Number.within(range: 2..7) }
    explanation      { 'gaeoriwefoj' }
    price            { 500 }
    association :user
  end
end
