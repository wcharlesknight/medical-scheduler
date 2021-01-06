class PharmaciesController < ApplicationController
    def index
        @pharmacies = Pharmacy.all
        @specialties = Specialty.all
        @hospitals = Hospital.all
        @doctors = Doctor.all
        @busiest = Pharmacy.all.max_by{|p| p.doctors.count}
        if params[:search]
            @pharmacy = Pharmacy.find_by(name: params[:search])
            redirect_to @pharmacy
        end
    end

    def show
        @pharmacy = Pharmacy.find(params[:id])
    end
end
