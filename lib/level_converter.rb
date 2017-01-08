class LevelConverter
  EXPERIENCE_GAP = 121

  def initialize(record)
    @experience = record.experience
    @level = record.level
  end

  def convert
    0.5 + 1 / 22.0 * Math.sqrt(8 * @experience + EXPERIENCE_GAP)
  end

  def reverse
    (0.5 * (@level**2 + @level) - @level) * EXPERIENCE_GAP
  end
end
