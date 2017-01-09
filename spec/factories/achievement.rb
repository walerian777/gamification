FactoryGirl.define do
  factory :achievement do
    id { SecureRandom.uuid }
    sequence(:name) { |n| "Achievement ##{n}" }
    description 'Test description'
    rank 'bronze'
  end
end
