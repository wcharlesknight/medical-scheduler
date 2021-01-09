class DoctorsController < ApplicationController
    before_action :current_doctor,  only: [:edit, :show, :update]
    skip_before_action :verify_authenticity_token, only: [:ratings]
    
    def index
        @doctors = Doctor.all
        @specialties = Specialty.all
        @hospitals = Hospital.all
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
        
    end

    def new
        @doctor = Doctor.new
        @pharmacies = Pharmacy.all
        @specialties = Specialty.all
    end

    def update
        if params[:rating].to_f >= 1 && params[:rating].to_f <= 10 
            @ratings = @doctor.rating.to_s.split(' ') << params[:rating].to_f
            @doctor.rating = @ratings.sum {|r| r.to_f } / @ratings.length
            @doctor.save
            redirect_to @doctor
        else
            flash[:notrating] = "Must be between 1 and 10"
            redirect_to @doctor
        end 
    end

    def edit
      
    end

    def analytics
        @highest_rated = Doctor.highest_rated
        @busiest = Doctor.busiest_doctor
        @busiest_pharm = Pharmacy.busiest_pharmacy
        @slowest_pharm = Pharmacy.slowest_pharmacy
        #@avg_rating_spec = Specialty.ave_rating
        @spec_highest = Specialty.highest_rating
        #@avg_cost_spec = Specialty.avg_cost
        @spec_high_cost = Specialty.highest_cost
        #@cheapest_dr_spec = Specialty.cheapest
        #@expensive_doc_spec = Specialty.expense
    end

    def ratings
        @ratings = []
        @doctors = Doctor.all
        if params[:list]
            @doctors.each do |d|
                if d.rating >= params[:list].to_i
                    @ratings << d
                end
            end
        end
        @sorted = @ratings.sort_by { |d| -d.rating}
    end
    

    private

    def current_doctor
        @doctor = Doctor.find(params[:id])
    end

end
