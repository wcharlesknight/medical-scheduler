class AppointmentsController < ApplicationController

    def new
        @appointments = Appointment.new
        @doctors = Doctor.all
        @patients = Patient.all
        @datetimes = Datetime.all
    end

    def edit
        @appointment = Appointment.find(params[:id])
    end

    def show
        @appointment = Appointment.find(params[:id])
    end

    def create
        @appointment = Appointment.create(appt_params) 
        @doctor = Doctor.find(@appointment.doctor_id)
        if @appointment.valid?
            redirect_to doctor_path(@appointment.doctor_id)
        else
            flash[:errors] = "That time is taken"
            redirect_to new_appointment_path 
        end
    end

    def destroy
        @appointment = Appointment.find(params[:id])
        @appointment.destroy
        redirect_to patient_path(@appointment.patient_id)
    end

    private

    def appt_params
        params.require(:appointment).permit(:datetime_id, :doctor_id, :patient_id, :symptoms)
    end


end
