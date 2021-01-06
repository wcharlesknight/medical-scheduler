class Hospital < ApplicationRecord
    has_many :doctors
    has_many :patients, through: :doctors

    def self.busiest_hospital
        @busiest = Hospital.all.max_by{|p| p.doctors.count}
    end

    def self.slowest_hospital
        @slowest = Hospital.all.min_by{|p|p.doctors.count}
    end

    def average_rating_hospital
        sum = self.doctors.map {|d| d.rating}.sum
        if sum != nil && sum != 0 
            avg = sum / self.doctors.count
        end
        if avg == nil
            avg = 0 
        end
        avg
    end

    def self.highest_rated_hospital
        self.all.max_by {|d| d.average_rating_hospital }
    end


end
