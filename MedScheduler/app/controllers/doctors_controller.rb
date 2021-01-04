class DoctorsController < ApplicationController

    def show
        @doctor = Doctor.find(params[:id])
        # @date = @doctor.appointments.each { |d| Datetime.find(d.datetime_id)}
        # @patient = @doctor.appointments.each { |d| Patient.find(d.patient_id).name}
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
