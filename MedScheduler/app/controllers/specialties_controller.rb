class SpecialtiesController < ApplicationController
    def index
        @specialties = Specialty.all
        @doctors = Doctor.all
        @highest = Specialty.highest_rating
    end

    def show
        @specialty = Specialty.find(params[:id])
    end

end
