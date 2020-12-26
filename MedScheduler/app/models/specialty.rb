class Specialty < ApplicationRecord
    has_many :doctors
    has_many :patients, through: :doctors
end
