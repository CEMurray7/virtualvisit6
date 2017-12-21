class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def index
    redirect_to new_session_path
  end

  def create
    @user = User.find_by(username: params[:username]).try(:authenticate, params[:password])

    if @user
      session[:user_id] = @user.id
      redirect_to userdashboards_path
    else
      flash[:notice] = "Not a valid username.  Please sign up first!"
      redirect_to new_user_path
    end
  end

  def show
  end
end
