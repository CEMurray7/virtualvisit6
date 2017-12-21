class DoctorsSessionsController < ApplicationController

  def new
        @doctor = Doctor.new
      end

      def index
        redirect_to new_doctors_session_path


      end

      def show
        @doctor = Doctor.all
      end

      def create
        # byebug
        @doctor = Doctor.find_by(username: params[:doctor][:username]).try(:authenticate, params[:doctor][:password])
        if @doctor
          session[:doctor_id] = @doctor.id
          redirect_to doctors_sessions_path
        else
          flash[:notice] = "Not a valid username.  Please sign up first!"
          redirect_to new_doctor_path
        end
      end
end
