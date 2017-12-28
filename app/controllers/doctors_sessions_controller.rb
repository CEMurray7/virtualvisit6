class DoctorsSessionsController < ApplicationController

    def new
        @doctor = Doctor.new
      end

      def index
        @appointment = Appointment.all
      end

      def show
        @appointment = Appointment.all
      end

      def create
        # byebug
        @doctor = Doctor.find_by(username: params[:doctor][:username]).try(:authenticate, params[:doctor][:password])
        if @doctor
          session[:doctor_id] = @doctor.id
          redirect_to doctors_session_path(@doctor)
        else
          flash[:notice] = "Not a valid username.  Please sign up first!"
          redirect_to new_doctor_path
        end
      end
end
