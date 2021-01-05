class DoctorsController < ApplicationController

    def index
        @doctors = Doctor.all
        @specialties = Specialty.all
        @hospitals = Hospital.all
        # @doctor = Doctor.search(params[:search])
        if params[:search]
            @doctor = Doctor.find_by(name: params[:search])
            @rating = Doctor.where(rating: params[:search])
            if @doctor    
                redirect_to @doctor
            elsif @rating
                @rating
            else
                flash[:error] = "Not a doctor or valid rating"
                #redirect_to doctors_path
            end
        end
    end

    def show
        @doctor = Doctor.find(params[:id])
        # @patient = Patient.find(patient_id).name
        # @datetime = Datetime.find(datetime_id).date
        # @pharmacy = Pharmacy.find(pharmacy_id).name
    end

    def new
        @doctor = Doctor.new
        @pharmacies = Pharmacy.all
        @specialties = Specialty.all
    end

    def edit
        @doctor = Doctor.find(params[:id])
    end

end
