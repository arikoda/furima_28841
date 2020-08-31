FactoryBot.define do
  factory :user do
    email                    {Faker::Internet.free_email} 
    password                 {"geoir8e"}
    password_confirmation    {password} 
    nickname                 { Faker::Name.initials(number: 3) }
    birthday                 { Faker::Date.birthday(min_age:18, max_age:90) }
    family_name              {"鈴木"}
    first_name               {"太郎"}
    family_n_ruby            {"スズキ"}
    first_n_ruby             {"タロー"}
  end
end 