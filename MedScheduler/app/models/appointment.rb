class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  belongs_to :datetime, optional: true
  # validates_uniqueness_of :datetime_id
  #validates :datetime_id, uniqueness: {message: "This appointment slot is taken, please choose another." }
  # accepts_nested_attributes_for :datetime, :patient_id, :doctor_id 
end
