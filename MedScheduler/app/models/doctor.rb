class Doctor < ApplicationRecord
  belongs_to :specialty
  belongs_to :pharmacy
  has_many :appointments
  has_many :patients, through: :appointments
  has_many :datetimes, through: :appointments

  accepts_nested_attributes_for :datetimes, :appointments

  # def availability
  #   Datetime.all.each do |d| 
  #     self.datetimes << d
  #   end
  # end

end
