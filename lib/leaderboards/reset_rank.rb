module Leaderboards
  class ResetRank
    def self.call(klass:, period:)
      new(klass, period).call
    end

    def initialize(klass, period)
      @klass = klass
      @method = "#{period}_rank"
    end

    def call
      @klass.send(@method).del
    end
  end
end
