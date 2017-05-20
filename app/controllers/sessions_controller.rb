class SessionsController < Devise::SessionsController
  def create
    cookies.signed[:user_id] = current_user.id
    super
  end

  def destroy
    cookies.delete(:user_id)
    super
  end
end
