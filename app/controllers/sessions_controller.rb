class SessionsController < ApplicationController
before_action :require_logged_in, only: [:show]
  def new
   @user = User.new
  end
  def create
   @user = User.find_by(username: params[:username]).try(:authenticate, params[:password])
   if @user
     session[:user_id] = @user.id
     redirect_to sessions_path(@user)
   else
     flash[:notice] = "Not a valid username.  Please sign up first!"
     redirect_to new_user_path
   end
  end
  def show
    @appointment = Appointment.where(user_id: current_user)
  end

  def index
  end


  def destroy
    session[:doctor_id] = nil
    session[:user_id] = nil
    redirect_to root_url, notice: 'Logged out!'
  end
end
