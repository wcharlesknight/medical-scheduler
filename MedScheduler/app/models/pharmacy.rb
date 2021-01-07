class Pharmacy < ApplicationRecord
    has_many :doctors
    has_many :patients, through: :doctors

    def self.busiest_pharmacy
        @busiest = Pharmacy.all.max_by{|p| p.doctors.count}
    end

    def self.slowest_pharmacy
        @slowest = Pharmacy.all.min_by{|p|p.doctors.count}
    end

end
