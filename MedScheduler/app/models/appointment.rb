class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  belongs_to :datetime, optional: true
  validates :datetime_id, uniqueness: { scope: :doctor, message: "This doctor's time slot is already taken, please choose another." }
  # accepts_nested_attributes_for :datetime, :patient_id, :doctor_id 
end
