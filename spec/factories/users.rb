FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "123456e12" }
    password_confirmation { "123456e12" }
    role { 0 }
  end
end