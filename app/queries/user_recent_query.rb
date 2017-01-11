class UserRecentQuery < BaseQuery
  def initialize(user)
    @user = user
  end

  def call(relation)
    relation
      .where(active: true)
      .where(user_id: @user.id)
      .where(created_at: 7.days.ago..Time.current)
      .order(created_at: :desc)
      .limit(10)
  end
end
