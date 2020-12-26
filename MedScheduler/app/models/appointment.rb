class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  belongs_to :datetime, optional: true

  # accepts_nested_attributes_for :datetime, :patient_id, :doctor_id 
end
