class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :doctor, optional: true

@waiting_list = Appointment.order(:created_at)




end
