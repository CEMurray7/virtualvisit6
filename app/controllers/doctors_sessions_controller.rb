class DoctorsSessionsController < ApplicationController


  def index
  end

  def show
    redirect_to doctors_sessions_path
    # @appointments = Appointment.all
  end

  def new
    @doctor = Doctor.new
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
