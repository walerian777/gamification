class UserRecentQuery < BaseQuery
  def initialize(user)
    @user = user
  end

  def call(relation)
    relation
      .where(active: true)
      .where(user_id: @user.id)
      .order(created_at: :desc)
      .limit(5)
  end
end
