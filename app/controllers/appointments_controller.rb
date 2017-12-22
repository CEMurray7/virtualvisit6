class AppointmentsController < ApplicationController
  def index
  end

  def create
  end

  def new
    @appointment = Appointment.new(user: current_user)
    if @appointment.save!
      redirect_to appointments_path
    else
      render :new
    end

    def show
      @appointments = Appointment.all
    end
  end

  private
  def appointment_params
    params.require(:appointment).permit(:name, :symptoms, :blood_pressure, :temperature, :timestamp)

end
