# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def faked_description
  ipsum_class = case rand(4)
                when 0 then FFaker::HipsterIpsum
                when 1 then FFaker::BaconIpsum
                when 2 then FFaker::CheesyLingo
                when 3 then FFaker::DizzleIpsum
                end
  ipsum_class.paragraph
end

def faked_reward
  case rand(5)
  when 0 then "'#{FFaker::Book.title}' by #{FFaker::Book.author}"
  when 1 then "A flight with #{FFaker::Airline.name}"
  when 2 then "#{FFaker::Skill.specialty} Online course"
  when 3 then FFaker::Product.product
  when 4 then "Two tickets for #{FFaker::Movie.title} movie."
  end
end

50.times do
  User.create!(
    email: FFaker::Internet.free_email,
    password: FFaker::Internet.password,
    first_name: FFaker::Name.first_name,
    last_name: FFaker::Name.last_name,
    position: FFaker::Job.title,
    location: FFaker::Address.city,
    twitter: FFaker::Internet.user_name,
    github: FFaker::Internet.user_name,
    website: FFaker::Internet.http_url,
    about_me: faked_description,
    last_seen_at: Time.current - rand(14).days
  ) 
end

10.times do
  team = Team.create!(name: FFaker::NatoAlphabet.alphabetic_code)
  members_count = rand(3..7)
  members_count.times do
    TeamsUser.create!(team_id: team.id, user_id: User.ids.shuffle.first)
  end
end

200.times do
  rank = case rand(3)
         when 0 then 'bronze'
         when 1 then 'silver'
         when 2 then 'gold'
         end
  achievement = Achievement.create!(
    name: FFaker::Movie.title,
    description: faked_description,
    rank: rank,
    rewards: rand(10).zero? ? nil : faked_reward
  )
  achievers_count = rand(1..5)
  achievers_count.times do
    AchievementsUser.create!(
      achievement_id: achievement.id,
      user_id: User.ids.shuffle.first,
      created_at: Time.current - rand(60).days
    )
  end
end
