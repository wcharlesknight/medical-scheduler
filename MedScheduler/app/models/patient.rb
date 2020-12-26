class Patient < ApplicationRecord
    belongs_to :pharmacy
    has_many :appointments
    has_many :doctors, through: :appointments
    has_many :datetimes, through: :appointments
end
