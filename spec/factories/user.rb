FactoryGirl.define do
  factory :user do
    id { SecureRandom.uuid }
    sequence(:email) { |n| "user#{n}@example.com" }
    password 'password'
    first_name 'John'
    last_name 'Smith'
  end
end
