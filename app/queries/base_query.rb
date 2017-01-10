class BaseQuery
  def |(other)
    ChainedQuery.new do |relation|
      other.call(call(relation))
    end
  end
end
