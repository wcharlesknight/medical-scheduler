class AppointmentsController < ApplicationController

    def new
        @appointments = Appointment.new
        @doctors = Doctor.all
        @patients = Patient.all
        @datetimes = Datetime.all
    end

    def show
        @appointment = Appointment.find(params[:id])
    end

    def create
        @appointment = Appointment.create(appt_params)
        @doctor = Doctor.find(@appointment.doctor_id)
        @doctor.appointments << @appointment
        @doctor.patients << Patient.find(@appointment.patient_id)
        redirect_to doctor_path(@appointment.doctor_id)
    end

    private

    def appt_params
        params.require(:appointment).permit(:datetime, :doctor_id, :patient_id)
    end


end
