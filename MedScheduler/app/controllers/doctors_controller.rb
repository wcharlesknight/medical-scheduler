class DoctorsController < ApplicationController

    def show
        @doctor = Doctor.find(params[:id])
        @highest_rated = @doctor.max{|d| d.rating}
    end

    def new
        @doctors = Doctor.all
        @pharmacies = Pharmacy.all
        @specialties = Specialty.all
    end

    def edit
        @doctor = Doctor.find(params[:id])
    end


    
end
