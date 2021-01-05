class Doctor < ApplicationRecord
  belongs_to :specialty
  belongs_to :pharmacy
  belongs_to :hospital
  has_many :appointments
  has_many :patients, through: :appointments
  has_many :datetimes, through: :appointments



end
