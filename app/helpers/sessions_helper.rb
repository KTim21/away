module SessionsHelper
  
  def log_in(user)
    session[:user_id] = user.id
  end
  
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end
  
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
    @current_user
  end
  
  def remember(user)
    user.rememberme
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end
  
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end
  
  def logged_in?
    !current_user.nil?
  end
  
  def is_admin?
    logged_in? && current_user.admin?
  end
  
  def user_is_part?(trip)
    logged_in? && trip.users.include?(current_user)
  end
  
  def user_correct?(user)
    logged_in? && current_user == user
  end
end
