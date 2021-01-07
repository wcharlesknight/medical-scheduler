class Specialty < ApplicationRecord
    has_many :doctors
    has_many :patients, through: :doctors

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
    def self.highest_rating
        self.all.max_by {|d| d.ave_rating }
    end

    def avg_cost
        sum = self.doctors.map {|d| d.cost_s}.sum
        if sum != nil && sum != 0 
            avg = sum / self.doctors.count
        end
        if avg == nil
         avg = 0 
        end
        avg
    end

    def self.highest_cost
        self.all.max_by {|d| d.avg_cost }
    end

    def cheapest
        self.doctors.min_by { |d| d.cost_s }
    end

    def expense
        self.doctors.max_by { |d| d.cost_s }
    end
    
    def cost_range
        "$#{self.cheapest.cost_s} - $#{self.expense.cost_s}"
    end

end
