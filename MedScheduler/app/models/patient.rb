class Patient < ApplicationRecord
    belongs_to :pharmacy
    has_many :appointments
    has_many :doctors, through: :appointments
    has_many :datetimes, through: :appointments

    def self.oldest
        Patient.all.max_by{|p| p.age }
    end

    def self.youngest
        Patient.all.min_by{|p| p.age}
    end
    
end
