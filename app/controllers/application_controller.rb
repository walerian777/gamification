class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_last_seen_at, if: proc { user_signed_in? && (session[:last_seen_at].nil? || session[:last_seen_at] < 15.minutes.ago) }

  private

  def set_last_seen_at
    current_user.update_attribute(:last_seen_at, Time.current)
    session[:last_seen_at] = Time.current
  end
end
