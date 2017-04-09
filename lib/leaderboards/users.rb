module Leaderboards
  class Users
    def self.call(params = {})
      new(params).call
    end

    def initialize(params)
      @params = default_params.merge(params)
    end

    def call
      start, stop = indices
      rank_name = "#{@params[:period]}_rank"
      scores = select_scores(start, stop, rank_name)
      users_with_scores(scores)
    end

    private

    def indices
      page = @params[:page] - 1
      start = page * 10
      stop = start + 9
      [start, stop]
    end

    def select_scores(start, stop, rank_name)
      User.send(rank_name).revrange(start, stop, with_scores: true)
    end

    def users_with_scores(scores)
      Hash[scores.map { |id, score| [User.find(id), score] }]
    end

    def default_params
      {
        page: 1,
        period: 'daily'
      }
    end
  end
end
