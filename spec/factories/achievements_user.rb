FactoryGirl.define do
  factory :achievements_user do
    id { SecureRandom.uuid }

    after :build do |achievements_user|
      achievements_user.achievement = FactoryGirl.create(:achievement)
      achievements_user.user = FactoryGirl.create(:user)
    end
  end
end
