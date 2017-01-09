FactoryGirl.define do
  factory :achievement do
    id { SecureRandom.uuid }
    sequence(:name) { |n| "Achievement ##{n}" }
    rank :bronze
  end
end
