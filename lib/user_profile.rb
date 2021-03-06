class UserProfile
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def monthly_top
    rank = User.monthly_rank.revrank(user.id)
    return if rank.nil?
    rank += 1
    count = User.active.count.to_f
    result = (rank / count * 100).round(2)
    return 0.01 if result.zero?
    result
  end

  def grouped_achievements
    user.achievements_users.active.group(:achievement_id).count.map do |id, count|
      [Achievement.find(id), count]
    end.to_h
  end

  def teams
    user.teams.where('teams_users.active = true').order('teams_users.created_at DESC')
  end

  def website_link
    return user.website if user.website =~ /^https?:\/\/\w+/
    "http://#{user.website}"
  end

  def twitter_link
    "https://twitter.com/@#{user.twitter}"
  end

  def github_link
    "https://github.com/#{user.github}"
  end

  private

  def method_missing(method_name)
    string_name = method_name.to_s
    case string_name
    when /^recent_\w+/
      recent_relation(string_name.split('recent_')[1])
    when /\w+_count$/
      relation_count(string_name.split('_count')[0])
    else
      return super unless user.respond_to?(method_name)
      user.send(method_name)
    end
  end

  def respond_to_missing?(method_name, include_private = false)
    string_name = method_name.to_s
    string_name =~ /(^recent_\w+)|(\w+_count$)/ || super
  end

  def recent_query
    @recent_query ||= UserRecentQuery.new(user)
  end

  def recent_relation(relation_name)
    relation = "#{relation_name}_user".classify.constantize
    recent_query.call(relation.send(:all))
  end

  def relation_count(relation_name)
    user.send(relation_name).try(:active).try(:count)
  end
end
