class Doctor < ApplicationRecord
  belongs_to :specialty
  belongs_to :pharmacy
  belongs_to :hospital
  has_many :appointments
  has_many :patients, through: :appointments
  has_many :datetimes, through: :appointments
  has_many :ratings
  #validates :datetime_id, uniqueness: { scope: :appointment }
  accepts_nested_attributes_for :datetimes, :appointments
  

  
  def self.highest_rated
    Doctor.all.max_by(&:rating)
  end

  def self.busiest_doctor
    Doctor.all.max_by {|d| d.patients.count}
  end

  

end
