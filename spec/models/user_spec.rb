describe User, type: :model do
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
