class Specialty < ApplicationRecord
    has_many :doctors
    has_many :patients, through: :doctors

    def rating
        self.doctors.map{|d| d.rating} / self.doctors.count
    end

    def highest_rating_specialist
        r
    end

end