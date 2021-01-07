class Doctor < ApplicationRecord
  belongs_to :specialty
  belongs_to :pharmacy
  belongs_to :hospital
  has_many :appointments
  has_many :patients, through: :appointments
  has_many :datetimes, through: :appointments
  # validates :datetime_id, uniqueness: { scope: :appointment }
  accepts_nested_attributes_for :datetimes, :appointments
  
  def cost_s
    case self.specialty.name
    when "Cardiologist"
      self.cost += 2000
    when "Nephrologist"
      self.cost += 1700
    when "Pulmonologist"
        self.cost += 1300
    when "Neurologist"
        self.cost += 1000
    when "Emergency Medicine"
      self.cost += 800
    when "Opthomologist"
      self.cost += 700 
    when "Gyenocology"
      self.cost += 600
    when "Gastroenterologist"
      self.cost += 400
    when "Infectious Disease"
      self.cost += 100
    when "Primary Care Doctor"
      self.cost += 10  
    end
  end

def self.highest_rated
Doctor.all.max_by(&:rating)
end

def self.busiest_doctor
Doctor.all.max_by {|d| d.patients.count}
end

def self.expensive_doctor
Doctor.all.max_by{|d| d.cost_s}
end

def self.cheapest_doctor
Doctor.all.min_by{|d| d.cost_s}
end

end
