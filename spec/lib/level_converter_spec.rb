require './lib/level_converter'

describe LevelConverter do
  before(:all) do
    @gap = LevelConverter::EXPERIENCE_GAP
  end

  describe '#convert' do
    it 'returns a valid level for given experience' do
      record1 = double(experience: @gap, level: nil)
      expect(LevelConverter.new(record1).convert.to_i).to eql(2)
      record2 = double(experience: @gap - 1, level: nil)
      expect(LevelConverter.new(record2).convert.to_i).to eql(1)
    end
  end

  describe '#reverse' do
    it 'returns experience needed for given level' do
      record1 = double(experience: nil, level: 2)
      expect(LevelConverter.new(record1).reverse.to_i).to eql(@gap)
      record2 = double(experience: nil, level: 1)
      expect(LevelConverter.new(record2).reverse.to_i).to eql(0)
    end
  end
end
