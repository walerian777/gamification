FactoryGirl.define do
  factory :user do
    id { SecureRandom.uuid }
    sequence(:email) { |n| "user#{n}@example.com" }
    password 'password'
  end
end
