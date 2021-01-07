class HospitalsController < ApplicationController

    def index
        @hospitals = Hospital.all
        @doctors = Doctor.all
        @patients = Patient.all
        @busiest = Hospital.busiest_hospital
        @slowest = Hospital.slowest_hospital
        @highest = Hospital.highest_rated_hospital
        # @average_rating = Hospital.average_rating_hospital
    end

    def show
        @hospital = Hospital.find(params[:id])
    end
end
