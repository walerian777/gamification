FactoryGirl.define do
  factory :teams_user do
    id { SecureRandom.uuid }

    after :build do |teams_user|
      teams_user.team = FactoryGirl.create(:team)
      teams_user.user = FactoryGirl.create(:user)
    end
  end
end
