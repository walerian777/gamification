describe Achievement, type: :model do
  it 'sets points for a given rank' do
    rank = 'silver'
    achievement = FactoryGirl.build(:achievement, rank: rank)
    expect(achievement.points).to eql(nil)
    achievement.save!
    expect(achievement.points).to eql(Achievement::RANKS[rank])
  end
end
