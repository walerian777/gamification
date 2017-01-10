class ChainedQuery < BaseQuery
  def initialize(&block)
    @block = block
  end

  def call(relation)
    @block.call(relation)
  end
end
