# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Patient.destroy_all
Hospital.destroy_all
Pharmacy.destroy_all
Specialty.destroy_all
Doctor.destroy_all


Hospital.create(name: 'San Francisco General Hospital')
Hospital.create(name: 'Harborview Medical Center')
Hospital.create(name: 'University of California San Francisco, Parnassus Hospital')
Hospital.create(name: 'University of Washington Medical Center')
Hospital.create(name: 'Swedish First Hill Hospital')

Pharmacy.create(name: "Walgreens on 5th")
Pharmacy.create(name: "CVS Downtown")
Pharmacy.create(name: "Safeway by the park")
Pharmacy.create(name: "Rite Aide near the school")
Pharmacy.create(name: "Walgreens on Main St.")

Specialty.create(name: "Emergency Medicine")
Specialty.create(name: "Primary Care Doctor")
Specialty.create(name: "Gastroenterologist")
Specialty.create(name: "Gyenocology")
Specialty.create(name: "Pulmonologist")
Specialty.create(name: "Infectious Disease")
Specialty.create(name: "Opthomologist")
Specialty.create(name: "Nephrologist")
Specialty.create(name: "Neurologist")
Specialty.create(name: "Cardiologist")


100.times do
    Patient.create(name:Faker::Name.name, age:rand(18..95), gender: Faker::Gender.binary_type) 
end

20.times do
    Doctor.create(name:Faker::Name.name, age:rand(32..65), specialty_id: Specialty.all.sample.id, pharmacy_id: Pharmacy.all.sample.id) 
end
