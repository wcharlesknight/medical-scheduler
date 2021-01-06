class PatientsController < ApplicationController

    def index
        @patients = Patient.all
        @doctors = Doctor.all
        @oldest = Patient.oldest
        @youngest = Patient.youngest
    end
    
    def show
        @patient = Patient.find(params[:id])
    end

    def update
        @patient = Patient.find(params[:id])
        @patient.update(patient_params)
        redirect_to @patient
    end

    def destroy
        @patient = Patient.find(params[:id]) 
        @patient.appointments.each do |d| 
         d.destroy
        end
    end

    private

    def patient_params
        params.require(:patient).permit(:name, :age, :gender)
    end

end
