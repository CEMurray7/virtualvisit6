class UsersController < ApplicationController
  def index
    @users = User.all
  end


  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_session_path, notice: 'Created User'
    else
      render :new
    end
  end

  def new
    @user = User.new
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:username, :name, :dob, :phone_number, :email, :gender, :address, :city, :state, :postal_code, :country, :password, :password_confirmation)
  end
end
