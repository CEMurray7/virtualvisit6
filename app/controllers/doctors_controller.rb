class DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all
  end

  def show
    @doctor = Doctor.find_by(params[:id])
  end

  def new
      @doctor = Doctor.new
    end
    def create
      @doctor = Doctor.new(doctor_params)
      if @doctor.save
        redirect_to doctors_sessions_path, notice: 'Created Doctor'
      else
        render :new
      end
    end
    private
        def doctor_params
          params.require(:doctor).permit(:username, :password, :password_confirmation)
        end
end
