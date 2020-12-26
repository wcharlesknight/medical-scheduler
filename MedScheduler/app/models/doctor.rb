class Doctor < ApplicationRecord
  belongs_to :specialty
  belongs_to :pharmacy
  has_many :appointments
  has_many :patients, through: :appointments
end
