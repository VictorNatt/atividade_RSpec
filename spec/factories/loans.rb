FactoryBot.define do
  factory :loan do
    association :book
    association :user
    returned { false }
  end
end