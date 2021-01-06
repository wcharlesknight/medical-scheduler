class Hospital < ApplicationRecord
    has_many :doctors
    has_many :patients, through: :doctors

    def self.busiest_hospital
        @busiest = Hospital.all.max_by{|p| p.doctors.count}
    end

    def self.slowest_hospital
        @slowest = Hospital.all.min_by{|p|p.doctors.count}
    end
end
