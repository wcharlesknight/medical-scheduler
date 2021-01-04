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
Datetime.destroy_all


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

Datetime.create(date: "Monday 8:00AM")
Datetime.create(date: "Monday 9:00AM")
Datetime.create(date: "Monday 10:00AM")
Datetime.create(date: "Monday 11:00AM")
Datetime.create(date: "Monday 12:00AM")
Datetime.create(date: "Monday 1:00PM")
Datetime.create(date: "Tuesday 8:00AM")
Datetime.create(date: "Tuesday 9:00AM")
Datetime.create(date: "Tuesday 10:00AM")
Datetime.create(date: "Tuesday 11:00AM")
Datetime.create(date: "Tuesday 12:00AM")
Datetime.create(date: "Tuesday 1:00PM")
Datetime.create(date: "Wednesday 8:00AM")
Datetime.create(date: "Wednesday 9:00AM")
Datetime.create(date: "Wednesday 10:00AM")
Datetime.create(date: "Wednesday 11:00AM")
Datetime.create(date: "Wednesday 12:00AM")
Datetime.create(date: "Wednesday 1:00PM")
Datetime.create(date: "Thursday 8:00AM")
Datetime.create(date: "Thursday 9:00AM")
Datetime.create(date: "Thursday 10:00AM")
Datetime.create(date: "Thursday 11:00AM")
Datetime.create(date: "Thursday 12:00AM")
Datetime.create(date: "Thursday 1:00PM")
Datetime.create(date: "Friday 8:00AM")
Datetime.create(date: "Friday 9:00AM")
Datetime.create(date: "Friday 10:00AM")
Datetime.create(date: "Friday 11:00AM")
Datetime.create(date: "Friday 12:00AM")
Datetime.create(date: "Friday 1:00PM")


100.times do
    Patient.create(name:Faker::Name.name, age:rand(18..95), gender: Faker::Gender.binary_type, pharmacy_id: Pharmacy.all.sample.id) 
end

20.times do
    Doctor.create(name: "Dr. #{Faker::Name.name}", age:rand(32..65), specialty_id: Specialty.all.sample.id, pharmacy_id: Pharmacy.all.sample.id, rating: rand(1..10), hospital_id: Hospital.all.sample.id)
end
