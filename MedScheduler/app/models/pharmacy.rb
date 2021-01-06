class Pharmacy < ApplicationRecord
    has_many :doctors
    has_many :patients, through: :doctors

    def self.busiest
        @busiest = Pharmacy.all.max_by{|p| p.doctors.count}
    end
end
