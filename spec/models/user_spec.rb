describe User, type: :model do
  describe '#level_up' do
    it 'calls LevelConverter as a before_save callback' do
      user = FactoryGirl.build(:user)
      user.experience += 100
      converter = double
      expect(LevelConverter).to receive(:new).with(user).and_return(converter)
      expect(converter).to receive(:convert).and_return(1)
      expect(user.level).to eql(1)
      user.run_callbacks(:save)
    end
  end

  describe '#assign_nickname' do
    it 'concatenates first name and last name' do
      user = FactoryGirl.create(:user, first_name: 'Abc', last_name: 'Def')
      expect(user.nickname).to eql('abc.def')
    end

    it 'adds a number to the non-unique nickname' do
      FactoryGirl.create(:user, nickname: 'abc.def')
      user = FactoryGirl.create(:user, first_name: 'Abc', last_name: 'Def')
      expect(user.nickname).to eql('abc.def.1')
    end
  end
end
