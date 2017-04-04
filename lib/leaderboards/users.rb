module Leaderboards
  class Users
    def self.call(params = {})
      new(params).call
    end

    def initialize(params)
      @params = default_params.merge(params)
    end

    def call
      @users = User.active
      @users = @users.order(order)
      @users = @users.page(@params[:page])
    end

    private

    def default_params
      {
        page: 1,
        order: 'experience_desc'
      }
    end

    def order
      order_hash.fetch(@params[:order], experience: :desc)
    end

    def order_hash
      Hash[order_columns.map { |c| [c, c.to_sym] } + order_columns.map { |c| ["#{c}_desc", { c => :desc }] }]
    end

    def order_columns
      %w(created_at experience first_name last_name level).freeze
    end
  end
end
