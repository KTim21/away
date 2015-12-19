class SessionsController < ApplicationController
  skip_before_action :authorize
  
  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user and user.authenticate(params[:password])
      log_in user
      remember user 
      redirect_to trips_url
    else
      redirect_to login_url, alert: "Benutzername oder Passwort falsch."
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to login_url
  end
end
