FactoryGirl.factories.map(&:name).each do |factory_name|
  RSpec.describe "#{factory_name} factory #build" do
    it 'is valid' do
      expect(build(factory_name)).to be_valid
    end
  end
end

FactoryGirl.factories.map(&:name).each do |factory_name|
  RSpec.describe "#{factory_name} factory #create" do
    it 'is valid' do
      expect(create(factory_name)).to be_valid
    end
  end
end

FactoryGirl.factories.map(&:name).each do |factory_name|
  RSpec.describe "#{factory_name} factory #build_stubbed" do
    it 'is persisted' do
      expect(build_stubbed(factory_name)).to be_persisted
    end
  end
end
