class Specialty < ApplicationRecord
    has_many :doctors
    has_many :patients, through: :doctors

    # def self.cost
    #     case self.name
    #     when "Cardiologist"
    #       self.cost = rand(2000..5000)
    #     when "Nephrologist"
    #       self.cost = rand(1750..3750)
    #     when "Pulmonologist"
    #         self.cost = rand(1500..2500)
    #     when "Neurologist"
    #         self.cost = rand(1250..2250)
    #     when "Emergency Medicine"
    #       self.cost = rand(1000..2000)
    #     when "Gyenocology"
    #       self.cost = rand(850..1900)
    #     when "Gastroenterologist"
    #       self.cost = rand(700..1800)
    #     when "Infectious Disease"
    #       self.cost = rand(500..1000)
    #     when "Primary Care Doctor"
    #       self.cost = rand(200..600)
    #     end
    #   end

    def ave_rating
        sum = self.doctors.map {|d| d.rating}.sum
        if sum != nil && sum != 0 
            avg = sum / self.doctors.count
        end
        if avg == nil
         avg = 0 
        end
        avg
    end
    
    def self.highest
        self.all.max_by {|d| d.ave_rating }
    end

end
