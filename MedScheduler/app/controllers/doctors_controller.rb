class DoctorsController < ApplicationController
    before_action :current_doctor,  only: [:edit, :show, :update ]
    
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
        #@doctor.rating.sum { |b| b} / @doctor.rating.length 
        
    end

    def new
        @doctor = Doctor.new
        @pharmacies = Pharmacy.all
        @specialties = Specialty.all
    end

    def update
        @ratings = @doctor.rating.to_s.split(' ') << params[:rating].to_f
        @doctor.rating = @ratings.sum {|r| r.to_f } / @ratings.length
        @doctor.save
        redirect_to @doctor
    end

    def edit
      
    end

    private

    def current_doctor
        @doctor = Doctor.find(params[:id])
    end

end
