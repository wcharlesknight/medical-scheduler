class AppointmentsController < ApplicationController

    def new
        @appointments = Appointment.new
        @doctors = Doctor.all
        @patients = Patient.all
    end
    def show
        @appointment = Appointment.find(params[:id])
    end
    
    def create
        @appointment = Appointment.create(appt_params)
    end

    private

    def appt_params
        params.require(:appointment).permit(:datetime, :doctor_id, :patient_id)
    end

end
