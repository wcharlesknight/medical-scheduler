class Doctor < ApplicationRecord
  belongs_to :specialty
  belongs_to :pharmacy
  belongs_to :hospital
  has_many :appointments
  has_many :patients, through: :appointments
  has_many :datetimes, through: :appointments

  accepts_nested_attributes_for :datetimes, :appointments

  def self.search(search)
      if search
        doctor = Doctor.find_by(name: search)
        if doctor
          self.where(doctor_id: doctor)
        else 
          @doctors = Doctor.all
        end
      else
        @doctors = Doctor.all
      end
  end

end
