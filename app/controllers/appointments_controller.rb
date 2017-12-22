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

    end
  end
end
