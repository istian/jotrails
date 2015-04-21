class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :check_user_session

  def check_user_session
    if session[:authenticated].nil?
      redirect_to user_login_path, :notice => "Session expired! You need to sign in."
    end
  end

end
