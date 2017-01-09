module AchievementsHelper
  def icon_style(achievement)
    "color: #{icon_color(achievement)}"
  end

  def icon_color(achievement)
    {
      'bronze' => 'saddlebrown',
      'silver' => 'silver',
      'gold' => 'gold'
    }.fetch(achievement.rank)
  end
end
