class SessionsController < ApplicationController
  before_action :require_logged_in, only: [:show]
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
          redirect_to root_path
        else
          flash[:notice] = "Not a valid username.  Please sign up first!"
          redirect_to new_user_path
        end
      end

      def show
        @users = User.all
      end
end
