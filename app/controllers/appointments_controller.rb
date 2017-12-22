class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all.sort_by(&:created_at)
  end

  def new
    @appointment = Appointment.new
  end
  def create
    @appointment = Appointment.new(user: current_user)
    if @appointment.save!
      redirect_to appointments_path
    else
      render :new
    end

    def show

    end
  end
end
