class UserRecentQuery < BaseQuery
  def call(relation, user = current_user)
    relation
      .where(user_id: user.id)
      .where(created_at: 7.days.ago..Time.current)
  end
end
