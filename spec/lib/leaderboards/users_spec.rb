describe Leaderboards::Users do
  describe '#call' do
    it 'returns ordered users' do
      worst_user = FactoryGirl.create(:user, experience: 100)
      best_user = FactoryGirl.create(:user, experience: 300)
      FactoryGirl.create(:user, experience: 200)
      results = Leaderboards::Users.call
      expect(results.length).to eql(3)
      expect(results.first).to eql(best_user)
      expect(results.last).to eql(worst_user)
    end
  end
end
