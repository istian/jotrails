class SessionController < ApplicationController

  skip_before_filter :check_user_session, :only => [:new, :create]

  def new
  end

  def create
    @user = User.authenticate_by_email(params[:email], params[:password])
    if @user && !@user[:authenticated]
      flash.now.alert = "Invalid email or password!"
      render "new"
    else
      session[:authenticated] = @user[:id]
      redirect_to user_dashboard_path, :success => "You have successfully logged in!"
    end
  end

  def destroy
    reset_session
    redirect_to user_login_path, :notice => "You have successfully logged out!"
  end
end
