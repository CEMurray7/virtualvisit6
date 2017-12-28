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

    def show
      @appointments = Appointment.all
    end

    def edit
      @appointments = Appointment.find(params[:id])
      end
    def update
      @appointments = Appointment.find(params[:id])
      if @appointments.update_attributes(current_doctor)
        redirect_to root_path
      else
        render 'edit'
      end
    end
  end

  private
  def appointment_params
    params.require(:appointment).permit(:name, :symptoms, :blood_pressure, :temperature, :timestamp)
  end
end
