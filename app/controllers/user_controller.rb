class UserController < ApplicationController

  skip_before_filter :check_user_session, :only => [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.create(params[:user])
    if @user.save
      redirect_to(user_register_path, :notice => "You have successfuly signed up!")
    else
      render "new"
    end
  end

  def dashboard

  end
end
