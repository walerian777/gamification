module UsersHelper
  def level_progressbar(user)
    capture_haml do
      haml_tag :div, class: 'progress' do
        haml_tag :div, progressbar_options(user) do
          haml_concat experience_ratio(user)
        end
      end
    end
  end

  def progressbar_options(user)
    {
      class: 'progress-bar progress-bar-success',
      role: 'progressbar',
      aria_valuenow: user.progress_percentage,
      aria_valuemin: 0,
      aria_valuemax: 100,
      style: "width: #{user.progress_percentage}%"
    }
  end

  def experience_ratio(user)
    "#{user.experience}/#{user.experience_for_next_level.to_i}"
  end
end
