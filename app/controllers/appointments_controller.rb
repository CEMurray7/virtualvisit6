class AppointmentsController < ApplicationController

  def index
    @appointments = Appointment.all
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
  end

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def show
    @appointments = Appointment.all
  end

  def update
    @appointment = Appointment.find(params[:id])
    if @appointment.update_attributes(doctor_id: current_doctor.id)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private
    def appointment_params
      params.require(:appointment).permit(:name, :symptoms, :blood_pressure, :temperature, :timestamp)
    end
end
