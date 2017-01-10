FactoryGirl.define do
  factory :team do
    id { SecureRandom.uuid }
    sequence(:name) { |n| "Team ##{n}" }
  end
end
